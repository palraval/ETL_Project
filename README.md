# ETL_Project

Summary: For the ETL project, we worked with our project partners Chris Kilkes, Palash Raval and Divya Govil to practice building an ETL pipeline using Python, Pandas, and Python dictionary methods to extract and transform the data. After we transformed the data, we created four CSV files and used the CSV file data to create an ERD and a table schema. Finally, we uploaded the CSV file data into a PostgresSQL database.

This project is divided into the following subsections:


1. Create the Category and Subcategory DataFrames
The "crowdfunding.xlsx" Excel data is extracted and transformed to create a category DataFrame that has the following columns:

A "category_id" column that has entries going sequentially from "cat1" to "catn", where n is the number of unique categories

A "category" column that contains only the category titles

This category DataFrame is exported as "category.csv" under the "Resources" folder to be used later. 

The following image shows this exported category DataFrame:
![image](https://github.com/palraval/ETL_Project/assets/157430192/d67fa2c8-e42e-4128-8e37-7e22a9750aaa)



2. Use the "crowdfunding.xlsx" Excel data to create a subcategory DataFrame that has the following columns:

A "subcategory_id" column that has entries going sequentially from "subcat1" to "subcatn", where n is the number of unique subcategories

A "subcategory" column that contains only the subcategory titles

This subcategory DataFrame is exported as a file called "subcategory.csv" in the "Resources" folder. 

The following image shows this exported subcategory DataFrame:
![image](https://github.com/palraval/ETL_Project/assets/157430192/d264e367-66ba-4c8a-bd1d-59e95b6bae7d)


3. Create the Campaign DataFrame using the "crowdfunding.xlsx" Excel data with the following columns:

The "cf_id" column

The "contact_id" column

The "company_name" column

The "description" column

The "goal" column

The "pledged" column

The "outcome" column

The "backers_count" column

The "country" column

The "currency" column

The "launch_date" column

The "end_date" column

The "category_id" column

The "subcategory_id" column

This campaign DataFrame is exported as "campaign.csv" under the "Resources" folder. 

The following image shows the exported campaign DataFrame:
![image](https://github.com/palraval/ETL_Project/assets/157430192/edda2502-21de-4a0b-90c9-c2126e4d330b)

4. Create the Contacts DataFrame using Python dictionary methods for the "contacts.xlsx" Excel data




Export the DataFrame as "contacts.csv" in the "Resources" folder.

