#!/usr/bin/env python
# coding: utf-8

import requests
from bs4 import BeautifulSoup
import json
import re

# CFPB Schema Table URL
url = 'https://ffiec.cfpb.gov/documentation/publications/modified-lar/modified-lar-schema'

response = requests.get(url)

# Parse HTML with handy Beautiful Soup library
soup = BeautifulSoup(response.text, 'html.parser')
table = soup.find('table')

# get headers
columns = [th.text.strip() for th in table.find('thead').find('tr').find_all('th')]

# get rows
data_rows = table.find('tbody').find_all('tr')

# dictionary where data will live
data_structure = []

# special custom mapping to python datatypes
data_type_replace_mapping = {
    'Integer': 'int',
    'Integer or Blank': 'int',
    'Integer or NA': 'int',
    'Integer or NA or Exempt': 'int',
    'Double or NA or Exempt': 'float',
    'Double or NA or Blank or Exempt': 'float',
    'String': 'str'
    # Add more replacements as needed
}

# the *actual* field names are never defined, they're only given in the actual file.
#   we'll add the raw field names, in order, here
file_field_names = [
    'activity_year', 'lei', 'loan_type', 'loan_purpose', 'preapproval', 'construction_method', 'occupancy_type',
    'loan_amount', 'action_taken', 'state_code', 'county_code', 'census_tract', 'applicant_ethnicity_1',
    'applicant_ethnicity_2', 'applicant_ethnicity_3', 'applicant_ethnicity_4', 'applicant_ethnicity_5',
    'co_applicant_ethnicity_1', 'co_applicant_ethnicity_2', 'co_applicant_ethnicity_3', 'co_applicant_ethnicity_4',
    'co_applicant_ethnicity_5', 'applicant_ethnicity_observed', 'co_applicant_ethnicity_observed',
    'applicant_race_1',
    'applicant_race_2', 'applicant_race_3', 'applicant_race_4', 'applicant_race_5', 'co_applicant_race_1',
    'co_applicant_race_2', 'co_applicant_race_3', 'co_applicant_race_4', 'co_applicant_race_5',
    'applicant_race_observed',
    'co_applicant_race_observed', 'applicant_sex', 'co_applicant_sex', 'applicant_sex_observed',
    'co_applicant_sex_observed', 'applicant_age', 'applicant_age_above_62', 'co_applicant_age',
    'co_applicant_age_above_62', 'income', 'purchaser_type', 'rate_spread', 'hoepa_status', 'lien_status',
    'applicant_credit_scoring_model', 'co_applicant_credit_scoring_model', 'denial_reason_1', 'denial_reason_2',
    'denial_reason_3', 'denial_reason_4', 'total_loan_costs', 'total_points_and_fees', 'origination_charges',
    'discount_points', 'lender_credits', 'interest_rate', 'prepayment_penalty_term', 'debt_to_income_ratio',
    'combined_loan_to_value_ratio', 'loan_term', 'intro_rate_period', 'balloon_payment', 'interest_only_payment',
    'negative_amortization', 'other_non_amortizing_features', 'property_value',
    'manufactured_home_secured_property_type',
    'manufactured_home_land_property_interest', 'total_units', 'multifamily_affordable_units',
    'submission_of_application', 'initially_payable_to_institution', 'aus_1', 'aus_2', 'aus_3', 'aus_4', 'aus_5',
    'reverse_mortgage', 'open_end_line_of_credit', 'business_or_commercial_purpose'
]

# for each row
for row in data_rows:
    # first: get the data in the columns
    row_data = dict(
        zip(
            columns,
            [td.text.strip() for td in row.find_all('td')]
        )
    )

    # next: start creating the dictionary
    data_field_name = row_data.get("Data Field Name", '')  # matches the header in the HTML table
    data_type = row_data.get("Field Type Description", '')  # matches the header in the HTML table
    data_field_number = row_data.get("Data Field Number", '')  # matches the header in the HTML table

    # use the custom mapping I hard coded above to make a new column for python data types
    proper_data_type = data_type_replace_mapping.get(data_type, data_type)

    # this is where things start to get "fun"
    # create a (nested) dictionary
    mapping_values = []
    # get the descriptions data
    descriptions_column_data = row.find_all('td')[columns.index('Descriptions and Examples')]
    # if the descriptions data matches my regex, continue on to parse out the mappings
    if descriptions_column_data and re.match(r"<td>Descriptions:<br/>\s*\d+\.", str(descriptions_column_data)):
        # BeautifulSoup needs to parse HTML twice, as it's sort of nested
        #   We're telling BeautifulSoup separate out each line, using the <br> tags
        for item in BeautifulSoup(str(descriptions_column_data), 'html.parser').stripped_strings:
            match = re.match(r'(\d+)\.\s*(.*)', item)
            if match:
                # each matched regex group must have its own key:value pair
                key, value = match.groups()
                mapping_values.append({"key": key, "value": value.strip()})

    # use the other custom mapping I made earlier for the field_field_names
    file_field_name = file_field_names.pop(0) if file_field_names else None

    # specify my final structure
    field_info_structure = {
        "raw_field_name": file_field_name,
        "pretty_field_name": data_field_name,
        "python_data_type": proper_data_type,
        "field_position": data_field_number,
        "value_mapping": mapping_values
    }

    # append my dictionary to the list of dictionaries
    data_structure.append(field_info_structure)

# create a newline delimited json file (because BigQuery likes newline delimited)
with open('hmda_dictionary.ndjson', 'w') as json_file:
    for item in data_structure:
        json.dump(item, json_file)
        json_file.write('\n')

print("HMDA data dictionary (newline-delimited JSON) saved as 'hmda_dictionary.ndjson'.")
