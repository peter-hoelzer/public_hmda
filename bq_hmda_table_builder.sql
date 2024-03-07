/* this is the actual query that runs as a result of running the bq_hmda_table_builder_execute_immediate.sql query */
SELECT
  activity_year,
  lei,
  u_map_loan_type.value AS loan_type,
  u_map_loan_purpose.value AS loan_purpose,
  u_map_preapproval.value AS preapproval,
  u_map_construction_method.value AS construction_method,
  u_map_occupancy_type.value AS occupancy_type,
  loan_amount,
  u_map_action_taken.value AS action_taken,
  state_code,
  county_code,
  census_tract,
  u_map_applicant_ethnicity_1.value AS applicant_ethnicity_1,
  u_map_applicant_ethnicity_2.value AS applicant_ethnicity_2,
  u_map_applicant_ethnicity_3.value AS applicant_ethnicity_3,
  u_map_applicant_ethnicity_4.value AS applicant_ethnicity_4,
  u_map_applicant_ethnicity_5.value AS applicant_ethnicity_5,
  u_map_co_applicant_ethnicity_1.value AS co_applicant_ethnicity_1,
  u_map_co_applicant_ethnicity_2.value AS co_applicant_ethnicity_2,
  u_map_co_applicant_ethnicity_3.value AS co_applicant_ethnicity_3,
  u_map_co_applicant_ethnicity_4.value AS co_applicant_ethnicity_4,
  u_map_co_applicant_ethnicity_5.value AS co_applicant_ethnicity_5,
  u_map_applicant_ethnicity_observed.value AS applicant_ethnicity_observed,
  u_map_co_applicant_ethnicity_observed.value AS co_applicant_ethnicity_observed,
  u_map_applicant_race_1.value AS applicant_race_1,
  u_map_applicant_race_2.value AS applicant_race_2,
  u_map_applicant_race_3.value AS applicant_race_3,
  u_map_applicant_race_4.value AS applicant_race_4,
  u_map_applicant_race_5.value AS applicant_race_5,
  u_map_co_applicant_race_1.value AS co_applicant_race_1,
  u_map_co_applicant_race_2.value AS co_applicant_race_2,
  u_map_co_applicant_race_3.value AS co_applicant_race_3,
  u_map_co_applicant_race_4.value AS co_applicant_race_4,
  u_map_co_applicant_race_5.value AS co_applicant_race_5,
  u_map_applicant_race_observed.value AS applicant_race_observed,
  u_map_co_applicant_race_observed.value AS co_applicant_race_observed,
  u_map_applicant_sex.value AS applicant_sex,
  u_map_co_applicant_sex.value AS co_applicant_sex,
  u_map_applicant_sex_observed.value AS applicant_sex_observed,
  u_map_co_applicant_sex_observed.value AS co_applicant_sex_observed,
  applicant_age,
  applicant_age_above_62,
  co_applicant_age,
  co_applicant_age_above_62,
  income,
  u_map_purchaser_type.value AS purchaser_type,
  rate_spread,
  u_map_hoepa_status.value AS hoepa_status,
  u_map_lien_status.value AS lien_status,
  u_map_applicant_credit_scoring_model.value AS applicant_credit_scoring_model,
  u_map_co_applicant_credit_scoring_model.value AS co_applicant_credit_scoring_model,
  u_map_denial_reason_1.value AS denial_reason_1,
  u_map_denial_reason_2.value AS denial_reason_2,
  u_map_denial_reason_3.value AS denial_reason_3,
  u_map_denial_reason_4.value AS denial_reason_4,
  total_loan_costs,
  total_points_and_fees,
  origination_charges,
  discount_points,
  lender_credits,
  interest_rate,
  prepayment_penalty_term,
  debt_to_income_ratio,
  combined_loan_to_value_ratio,
  loan_term,
  intro_rate_period,
  u_map_balloon_payment.value AS balloon_payment,
  u_map_interest_only_payment.value AS interest_only_payment,
  u_map_negative_amortization.value AS negative_amortization,
  u_map_other_non_amortizing_features.value AS other_non_amortizing_features,
  property_value,
  u_map_manufactured_home_secured_property_type.value AS manufactured_home_secured_property_type,
  u_map_manufactured_home_land_property_interest.value AS manufactured_home_land_property_interest,
  total_units,
  multifamily_affordable_units,
  u_map_submission_of_application.value AS submission_of_application,
  u_map_initially_payable_to_institution.value AS initially_payable_to_institution,
  u_map_aus_1.value AS aus_1,
  u_map_aus_2.value AS aus_2,
  u_map_aus_3.value AS aus_3,
  u_map_aus_4.value AS aus_4,
  u_map_aus_5.value AS aus_5,
  u_map_reverse_mortgage.value AS reverse_mortgage,
  u_map_open_end_line_of_credit.value AS open_end_line_of_credit,
  u_map_business_or_commercial_purpose.value AS business_or_commercial_purpose
FROM
  coral-gate-345321.hmda.mlar_2022 mlar
LEFT JOIN
  hmda.hmda_field_mapping AS map_loan_type
ON
  map_loan_type.raw_field_name = 'loan_type'
LEFT JOIN
  UNNEST(map_loan_type.value_mapping) AS u_map_loan_type
ON
  u_map_loan_type.key = mlar.loan_type
LEFT JOIN
  hmda.hmda_field_mapping AS map_loan_purpose
ON
  map_loan_purpose.raw_field_name = 'loan_purpose'
LEFT JOIN
  UNNEST(map_loan_purpose.value_mapping) AS u_map_loan_purpose
ON
  u_map_loan_purpose.key = mlar.loan_purpose
LEFT JOIN
  hmda.hmda_field_mapping AS map_preapproval
ON
  map_preapproval.raw_field_name = 'preapproval'
LEFT JOIN
  UNNEST(map_preapproval.value_mapping) AS u_map_preapproval
ON
  u_map_preapproval.key = mlar.preapproval
LEFT JOIN
  hmda.hmda_field_mapping AS map_construction_method
ON
  map_construction_method.raw_field_name = 'construction_method'
LEFT JOIN
  UNNEST(map_construction_method.value_mapping) AS u_map_construction_method
ON
  u_map_construction_method.key = mlar.construction_method
LEFT JOIN
  hmda.hmda_field_mapping AS map_occupancy_type
ON
  map_occupancy_type.raw_field_name = 'occupancy_type'
LEFT JOIN
  UNNEST(map_occupancy_type.value_mapping) AS u_map_occupancy_type
ON
  u_map_occupancy_type.key = mlar.occupancy_type
LEFT JOIN
  hmda.hmda_field_mapping AS map_action_taken
ON
  map_action_taken.raw_field_name = 'action_taken'
LEFT JOIN
  UNNEST(map_action_taken.value_mapping) AS u_map_action_taken
ON
  u_map_action_taken.key = mlar.action_taken
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_ethnicity_1
ON
  map_applicant_ethnicity_1.raw_field_name = 'applicant_ethnicity_1'
LEFT JOIN
  UNNEST(map_applicant_ethnicity_1.value_mapping) AS u_map_applicant_ethnicity_1
ON
  u_map_applicant_ethnicity_1.key = mlar.applicant_ethnicity_1
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_ethnicity_2
ON
  map_applicant_ethnicity_2.raw_field_name = 'applicant_ethnicity_2'
LEFT JOIN
  UNNEST(map_applicant_ethnicity_2.value_mapping) AS u_map_applicant_ethnicity_2
ON
  u_map_applicant_ethnicity_2.key = mlar.applicant_ethnicity_2
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_ethnicity_3
ON
  map_applicant_ethnicity_3.raw_field_name = 'applicant_ethnicity_3'
LEFT JOIN
  UNNEST(map_applicant_ethnicity_3.value_mapping) AS u_map_applicant_ethnicity_3
ON
  u_map_applicant_ethnicity_3.key = mlar.applicant_ethnicity_3
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_ethnicity_4
ON
  map_applicant_ethnicity_4.raw_field_name = 'applicant_ethnicity_4'
LEFT JOIN
  UNNEST(map_applicant_ethnicity_4.value_mapping) AS u_map_applicant_ethnicity_4
ON
  u_map_applicant_ethnicity_4.key = mlar.applicant_ethnicity_4
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_ethnicity_5
ON
  map_applicant_ethnicity_5.raw_field_name = 'applicant_ethnicity_5'
LEFT JOIN
  UNNEST(map_applicant_ethnicity_5.value_mapping) AS u_map_applicant_ethnicity_5
ON
  u_map_applicant_ethnicity_5.key = mlar.applicant_ethnicity_5
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_ethnicity_1
ON
  map_co_applicant_ethnicity_1.raw_field_name = 'co_applicant_ethnicity_1'
LEFT JOIN
  UNNEST(map_co_applicant_ethnicity_1.value_mapping) AS u_map_co_applicant_ethnicity_1
ON
  u_map_co_applicant_ethnicity_1.key = mlar.co_applicant_ethnicity_1
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_ethnicity_2
ON
  map_co_applicant_ethnicity_2.raw_field_name = 'co_applicant_ethnicity_2'
LEFT JOIN
  UNNEST(map_co_applicant_ethnicity_2.value_mapping) AS u_map_co_applicant_ethnicity_2
ON
  u_map_co_applicant_ethnicity_2.key = mlar.co_applicant_ethnicity_2
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_ethnicity_3
ON
  map_co_applicant_ethnicity_3.raw_field_name = 'co_applicant_ethnicity_3'
LEFT JOIN
  UNNEST(map_co_applicant_ethnicity_3.value_mapping) AS u_map_co_applicant_ethnicity_3
ON
  u_map_co_applicant_ethnicity_3.key = mlar.co_applicant_ethnicity_3
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_ethnicity_4
ON
  map_co_applicant_ethnicity_4.raw_field_name = 'co_applicant_ethnicity_4'
LEFT JOIN
  UNNEST(map_co_applicant_ethnicity_4.value_mapping) AS u_map_co_applicant_ethnicity_4
ON
  u_map_co_applicant_ethnicity_4.key = mlar.co_applicant_ethnicity_4
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_ethnicity_5
ON
  map_co_applicant_ethnicity_5.raw_field_name = 'co_applicant_ethnicity_5'
LEFT JOIN
  UNNEST(map_co_applicant_ethnicity_5.value_mapping) AS u_map_co_applicant_ethnicity_5
ON
  u_map_co_applicant_ethnicity_5.key = mlar.co_applicant_ethnicity_5
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_ethnicity_observed
ON
  map_applicant_ethnicity_observed.raw_field_name = 'applicant_ethnicity_observed'
LEFT JOIN
  UNNEST(map_applicant_ethnicity_observed.value_mapping) AS u_map_applicant_ethnicity_observed
ON
  u_map_applicant_ethnicity_observed.key = mlar.applicant_ethnicity_observed
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_ethnicity_observed
ON
  map_co_applicant_ethnicity_observed.raw_field_name = 'co_applicant_ethnicity_observed'
LEFT JOIN
  UNNEST(map_co_applicant_ethnicity_observed.value_mapping) AS u_map_co_applicant_ethnicity_observed
ON
  u_map_co_applicant_ethnicity_observed.key = mlar.co_applicant_ethnicity_observed
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_race_1
ON
  map_applicant_race_1.raw_field_name = 'applicant_race_1'
LEFT JOIN
  UNNEST(map_applicant_race_1.value_mapping) AS u_map_applicant_race_1
ON
  u_map_applicant_race_1.key = mlar.applicant_race_1
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_race_2
ON
  map_applicant_race_2.raw_field_name = 'applicant_race_2'
LEFT JOIN
  UNNEST(map_applicant_race_2.value_mapping) AS u_map_applicant_race_2
ON
  u_map_applicant_race_2.key = mlar.applicant_race_2
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_race_3
ON
  map_applicant_race_3.raw_field_name = 'applicant_race_3'
LEFT JOIN
  UNNEST(map_applicant_race_3.value_mapping) AS u_map_applicant_race_3
ON
  u_map_applicant_race_3.key = mlar.applicant_race_3
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_race_4
ON
  map_applicant_race_4.raw_field_name = 'applicant_race_4'
LEFT JOIN
  UNNEST(map_applicant_race_4.value_mapping) AS u_map_applicant_race_4
ON
  u_map_applicant_race_4.key = mlar.applicant_race_4
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_race_5
ON
  map_applicant_race_5.raw_field_name = 'applicant_race_5'
LEFT JOIN
  UNNEST(map_applicant_race_5.value_mapping) AS u_map_applicant_race_5
ON
  u_map_applicant_race_5.key = mlar.applicant_race_5
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_race_1
ON
  map_co_applicant_race_1.raw_field_name = 'co_applicant_race_1'
LEFT JOIN
  UNNEST(map_co_applicant_race_1.value_mapping) AS u_map_co_applicant_race_1
ON
  u_map_co_applicant_race_1.key = mlar.co_applicant_race_1
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_race_2
ON
  map_co_applicant_race_2.raw_field_name = 'co_applicant_race_2'
LEFT JOIN
  UNNEST(map_co_applicant_race_2.value_mapping) AS u_map_co_applicant_race_2
ON
  u_map_co_applicant_race_2.key = mlar.co_applicant_race_2
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_race_3
ON
  map_co_applicant_race_3.raw_field_name = 'co_applicant_race_3'
LEFT JOIN
  UNNEST(map_co_applicant_race_3.value_mapping) AS u_map_co_applicant_race_3
ON
  u_map_co_applicant_race_3.key = mlar.co_applicant_race_3
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_race_4
ON
  map_co_applicant_race_4.raw_field_name = 'co_applicant_race_4'
LEFT JOIN
  UNNEST(map_co_applicant_race_4.value_mapping) AS u_map_co_applicant_race_4
ON
  u_map_co_applicant_race_4.key = mlar.co_applicant_race_4
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_race_5
ON
  map_co_applicant_race_5.raw_field_name = 'co_applicant_race_5'
LEFT JOIN
  UNNEST(map_co_applicant_race_5.value_mapping) AS u_map_co_applicant_race_5
ON
  u_map_co_applicant_race_5.key = mlar.co_applicant_race_5
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_race_observed
ON
  map_applicant_race_observed.raw_field_name = 'applicant_race_observed'
LEFT JOIN
  UNNEST(map_applicant_race_observed.value_mapping) AS u_map_applicant_race_observed
ON
  u_map_applicant_race_observed.key = mlar.applicant_race_observed
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_race_observed
ON
  map_co_applicant_race_observed.raw_field_name = 'co_applicant_race_observed'
LEFT JOIN
  UNNEST(map_co_applicant_race_observed.value_mapping) AS u_map_co_applicant_race_observed
ON
  u_map_co_applicant_race_observed.key = mlar.co_applicant_race_observed
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_sex
ON
  map_applicant_sex.raw_field_name = 'applicant_sex'
LEFT JOIN
  UNNEST(map_applicant_sex.value_mapping) AS u_map_applicant_sex
ON
  u_map_applicant_sex.key = mlar.applicant_sex
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_sex
ON
  map_co_applicant_sex.raw_field_name = 'co_applicant_sex'
LEFT JOIN
  UNNEST(map_co_applicant_sex.value_mapping) AS u_map_co_applicant_sex
ON
  u_map_co_applicant_sex.key = mlar.co_applicant_sex
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_sex_observed
ON
  map_applicant_sex_observed.raw_field_name = 'applicant_sex_observed'
LEFT JOIN
  UNNEST(map_applicant_sex_observed.value_mapping) AS u_map_applicant_sex_observed
ON
  u_map_applicant_sex_observed.key = mlar.applicant_sex_observed
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_sex_observed
ON
  map_co_applicant_sex_observed.raw_field_name = 'co_applicant_sex_observed'
LEFT JOIN
  UNNEST(map_co_applicant_sex_observed.value_mapping) AS u_map_co_applicant_sex_observed
ON
  u_map_co_applicant_sex_observed.key = mlar.co_applicant_sex_observed
LEFT JOIN
  hmda.hmda_field_mapping AS map_purchaser_type
ON
  map_purchaser_type.raw_field_name = 'purchaser_type'
LEFT JOIN
  UNNEST(map_purchaser_type.value_mapping) AS u_map_purchaser_type
ON
  u_map_purchaser_type.key = mlar.purchaser_type
LEFT JOIN
  hmda.hmda_field_mapping AS map_hoepa_status
ON
  map_hoepa_status.raw_field_name = 'hoepa_status'
LEFT JOIN
  UNNEST(map_hoepa_status.value_mapping) AS u_map_hoepa_status
ON
  u_map_hoepa_status.key = mlar.hoepa_status
LEFT JOIN
  hmda.hmda_field_mapping AS map_lien_status
ON
  map_lien_status.raw_field_name = 'lien_status'
LEFT JOIN
  UNNEST(map_lien_status.value_mapping) AS u_map_lien_status
ON
  u_map_lien_status.key = mlar.lien_status
LEFT JOIN
  hmda.hmda_field_mapping AS map_applicant_credit_scoring_model
ON
  map_applicant_credit_scoring_model.raw_field_name = 'applicant_credit_scoring_model'
LEFT JOIN
  UNNEST(map_applicant_credit_scoring_model.value_mapping) AS u_map_applicant_credit_scoring_model
ON
  u_map_applicant_credit_scoring_model.key = mlar.applicant_credit_scoring_model
LEFT JOIN
  hmda.hmda_field_mapping AS map_co_applicant_credit_scoring_model
ON
  map_co_applicant_credit_scoring_model.raw_field_name = 'co_applicant_credit_scoring_model'
LEFT JOIN
  UNNEST(map_co_applicant_credit_scoring_model.value_mapping) AS u_map_co_applicant_credit_scoring_model
ON
  u_map_co_applicant_credit_scoring_model.key = mlar.co_applicant_credit_scoring_model
LEFT JOIN
  hmda.hmda_field_mapping AS map_denial_reason_1
ON
  map_denial_reason_1.raw_field_name = 'denial_reason_1'
LEFT JOIN
  UNNEST(map_denial_reason_1.value_mapping) AS u_map_denial_reason_1
ON
  u_map_denial_reason_1.key = mlar.denial_reason_1
LEFT JOIN
  hmda.hmda_field_mapping AS map_denial_reason_2
ON
  map_denial_reason_2.raw_field_name = 'denial_reason_2'
LEFT JOIN
  UNNEST(map_denial_reason_2.value_mapping) AS u_map_denial_reason_2
ON
  u_map_denial_reason_2.key = mlar.denial_reason_2
LEFT JOIN
  hmda.hmda_field_mapping AS map_denial_reason_3
ON
  map_denial_reason_3.raw_field_name = 'denial_reason_3'
LEFT JOIN
  UNNEST(map_denial_reason_3.value_mapping) AS u_map_denial_reason_3
ON
  u_map_denial_reason_3.key = mlar.denial_reason_3
LEFT JOIN
  hmda.hmda_field_mapping AS map_denial_reason_4
ON
  map_denial_reason_4.raw_field_name = 'denial_reason_4'
LEFT JOIN
  UNNEST(map_denial_reason_4.value_mapping) AS u_map_denial_reason_4
ON
  u_map_denial_reason_4.key = mlar.denial_reason_4
LEFT JOIN
  hmda.hmda_field_mapping AS map_balloon_payment
ON
  map_balloon_payment.raw_field_name = 'balloon_payment'
LEFT JOIN
  UNNEST(map_balloon_payment.value_mapping) AS u_map_balloon_payment
ON
  u_map_balloon_payment.key = mlar.balloon_payment
LEFT JOIN
  hmda.hmda_field_mapping AS map_interest_only_payment
ON
  map_interest_only_payment.raw_field_name = 'interest_only_payment'
LEFT JOIN
  UNNEST(map_interest_only_payment.value_mapping) AS u_map_interest_only_payment
ON
  u_map_interest_only_payment.key = mlar.interest_only_payment
LEFT JOIN
  hmda.hmda_field_mapping AS map_negative_amortization
ON
  map_negative_amortization.raw_field_name = 'negative_amortization'
LEFT JOIN
  UNNEST(map_negative_amortization.value_mapping) AS u_map_negative_amortization
ON
  u_map_negative_amortization.key = mlar.negative_amortization
LEFT JOIN
  hmda.hmda_field_mapping AS map_other_non_amortizing_features
ON
  map_other_non_amortizing_features.raw_field_name = 'other_non_amortizing_features'
LEFT JOIN
  UNNEST(map_other_non_amortizing_features.value_mapping) AS u_map_other_non_amortizing_features
ON
  u_map_other_non_amortizing_features.key = mlar.other_non_amortizing_features
LEFT JOIN
  hmda.hmda_field_mapping AS map_manufactured_home_secured_property_type
ON
  map_manufactured_home_secured_property_type.raw_field_name = 'manufactured_home_secured_property_type'
LEFT JOIN
  UNNEST(map_manufactured_home_secured_property_type.value_mapping) AS u_map_manufactured_home_secured_property_type
ON
  u_map_manufactured_home_secured_property_type.key = mlar.manufactured_home_secured_property_type
LEFT JOIN
  hmda.hmda_field_mapping AS map_manufactured_home_land_property_interest
ON
  map_manufactured_home_land_property_interest.raw_field_name = 'manufactured_home_land_property_interest'
LEFT JOIN
  UNNEST(map_manufactured_home_land_property_interest.value_mapping) AS u_map_manufactured_home_land_property_interest
ON
  u_map_manufactured_home_land_property_interest.key = mlar.manufactured_home_land_property_interest
LEFT JOIN
  hmda.hmda_field_mapping AS map_submission_of_application
ON
  map_submission_of_application.raw_field_name = 'submission_of_application'
LEFT JOIN
  UNNEST(map_submission_of_application.value_mapping) AS u_map_submission_of_application
ON
  u_map_submission_of_application.key = mlar.submission_of_application
LEFT JOIN
  hmda.hmda_field_mapping AS map_initially_payable_to_institution
ON
  map_initially_payable_to_institution.raw_field_name = 'initially_payable_to_institution'
LEFT JOIN
  UNNEST(map_initially_payable_to_institution.value_mapping) AS u_map_initially_payable_to_institution
ON
  u_map_initially_payable_to_institution.key = mlar.initially_payable_to_institution
LEFT JOIN
  hmda.hmda_field_mapping AS map_aus_1
ON
  map_aus_1.raw_field_name = 'aus_1'
LEFT JOIN
  UNNEST(map_aus_1.value_mapping) AS u_map_aus_1
ON
  u_map_aus_1.key = mlar.aus_1
LEFT JOIN
  hmda.hmda_field_mapping AS map_aus_2
ON
  map_aus_2.raw_field_name = 'aus_2'
LEFT JOIN
  UNNEST(map_aus_2.value_mapping) AS u_map_aus_2
ON
  u_map_aus_2.key = mlar.aus_2
LEFT JOIN
  hmda.hmda_field_mapping AS map_aus_3
ON
  map_aus_3.raw_field_name = 'aus_3'
LEFT JOIN
  UNNEST(map_aus_3.value_mapping) AS u_map_aus_3
ON
  u_map_aus_3.key = mlar.aus_3
LEFT JOIN
  hmda.hmda_field_mapping AS map_aus_4
ON
  map_aus_4.raw_field_name = 'aus_4'
LEFT JOIN
  UNNEST(map_aus_4.value_mapping) AS u_map_aus_4
ON
  u_map_aus_4.key = mlar.aus_4
LEFT JOIN
  hmda.hmda_field_mapping AS map_aus_5
ON
  map_aus_5.raw_field_name = 'aus_5'
LEFT JOIN
  UNNEST(map_aus_5.value_mapping) AS u_map_aus_5
ON
  u_map_aus_5.key = mlar.aus_5
LEFT JOIN
  hmda.hmda_field_mapping AS map_reverse_mortgage
ON
  map_reverse_mortgage.raw_field_name = 'reverse_mortgage'
LEFT JOIN
  UNNEST(map_reverse_mortgage.value_mapping) AS u_map_reverse_mortgage
ON
  u_map_reverse_mortgage.key = mlar.reverse_mortgage
LEFT JOIN
  hmda.hmda_field_mapping AS map_open_end_line_of_credit
ON
  map_open_end_line_of_credit.raw_field_name = 'open_end_line_of_credit'
LEFT JOIN
  UNNEST(map_open_end_line_of_credit.value_mapping) AS u_map_open_end_line_of_credit
ON
  u_map_open_end_line_of_credit.key = mlar.open_end_line_of_credit
LEFT JOIN
  hmda.hmda_field_mapping AS map_business_or_commercial_purpose
ON
  map_business_or_commercial_purpose.raw_field_name = 'business_or_commercial_purpose'
LEFT JOIN
  UNNEST(map_business_or_commercial_purpose.value_mapping) AS u_map_business_or_commercial_purpose
ON
  u_map_business_or_commercial_purpose.key = mlar.business_or_commercial_purpose
