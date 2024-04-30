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

# Create the Crowdfunding Database
Instructions:
- Inspect the four CSV files, and then sketch an ERD of the tables by using QuickDBDLinks to an external site..
-Use the information from the ERD to create a table schema for each CSV file.
- Note: Remember to specify the data types, primary keys, foreign keys, and other constraints.

Entity  Relationship Diagram summary:
We inspected the four CSV files output in the preceding query building/running phases and drafted an Entity Relationship Diagram indicating the positioning of the four tables and their connection points. Specifically the four tables are:
- Contacts: A table containing the fundraiser contacts listing Contact ID (the primary key for this table), First Name (a Varchar field), Last Name (a Varchar field), and Email Address (a Varchar field).
- Campaign: A table that sits at the center of the database holding as it does the bulk of the various fundraiser data fields, specifically: Category ID (one of the table's Foreign Keys), Sub-Category ID (Foreign Key), Contact ID (Foreign Key), CF ID (the table's Primary Key), Company Name, Fundraiser Description, Goal, Pledged, Outcome, Backers Count, Country, Currency, Launch Date and Start Date fields.
- Category: A table that holds the Category ID (the table's Primary Key) and Category data field in the database.
- Sub-Category: A table that holds the Sub-Category ID (the table's Primary Key) and Sub-Category data field in the database.

How do the various tables connect? As outlined in the Entity Relationship Diagram, the Campaign table sits at the center of the database and is connected to the various tables as follows:
- Contacts table connects to the Campaign table via its Primary Key, the Contact ID, which is one of the Foreign Keys for the Campaign table. Because there can be multiple contacts per fundraiser and multiple fundraisers to any which contact can be associated, this relationship is considered bi-directional and many-to-many on both sides.
- Category table connects to the Campaign table via its Primary Key, the Category ID, which is one of the Foreign Keys for the Campaign table. Because there can only be one Category ID per project but there can be multiple Campaigns this relationship is considered uni-directional (from Category to Campaign) and one-to-many (from Category to Campaign).
- Sub-Category table connects to the Campaign table via its Primary Key, the Sub-Category ID, which is a Foreign Key for the Campaign table. Because there can only be one Sub-Category ID per project but there can be multiple Campaigns this relationship is considered uni-directional (from Sub-Category to Campaign) and one-to-many (from Sub-Category to Campaign).
