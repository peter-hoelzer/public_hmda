# Home Mortgage Disclosure Act (HMDA) Data Transformation
The Home Mortgage Disclosure Act (HMDA) requires home lenders to submit basic information about loans, applications, borrowers, and properties to the Consumer Financial Protection Bureau (CFPB).
This data is rich and generally looked after, though data transformation is necessary to get the files to play nice with data analysis and visualization tools like Tableau or Looker. And of course -- cleanliness checks are always necessary.

I'll use this readme to detail some of the steps taken to prep this data for use in Tableau or other visualization tools.

### Source
The CFPB posts yearly files or ["upon institution resubmission"](https://ffiec.cfpb.gov/data-publication/2022#:~:text=Upon%20Institution%20resubmission).

The **data dictionaries** for 2018 and later can be found [here](https://ffiec.cfpb.gov/documentation/publications/modified-lar/resources/data-dictionaries/mlar-dd-2018-onward).
