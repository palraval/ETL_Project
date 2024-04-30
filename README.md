# ETL_Project

Summary: For the ETL project, we worked with our project partners Chris Kilkes, Palash Raval and Divya Govil to practice building an ETL pipeline using Python, Pandas, and Python dictionary methods to extract and transform the data. After we transformed the data, we created four CSV files and used the CSV file data to create an ERD and a table schema. Finally, we uploaded the CSV file data into a PostgresSQL database.

This project is divided into the following subsections:


**1. Create the Category DataFrame**

The "crowdfunding.xlsx" Excel data is extracted and transformed to create a category DataFrame. 

The category DataFrame has the following columns:

A "category_id" column that has entries going sequentially from "cat1" to "catn", where n is the number of unique categories

A "category" column that contains only the unique category titles from the data file

This category DataFrame is exported as "category.csv" under the "Resources" folder to be used later. 


**2. Create the Subcategory DataFrame** 

The "crowdfunding.xlsx" Excel data to create a subcategory DataFrame that has the following columns:

A "subcategory_id" column that has entries going sequentially from "subcat1" to "subcatn", where n is the number of unique subcategories

A "subcategory" column that contains only the unique subcategory titles from the data file

This subcategory DataFrame is exported as a file called "subcategory.csv" in the "Resources" folder. 


**3. Create the Campaign DataFrame** 

The "crowdfunding.xlsx" Excel data is used to create a campaign DataFrame with the following columns:**

The "cf_id" column

The "contact_id" column

The "company_name" column

The "description" column (renamed from the "blurb" column in the data file)

The "goal" column (values converted to a float datatype)

The "pledged" column (values converted to a float datatype)

The "outcome" column

The "backers_count" column

The "country" column

The "currency" column

The "launch_date" column (renamed from "launched_at" column and converted to datetime format)

The "end_date" column (renamed from "deadline" column and converted to datetime format)

The "category_id" column

The "subcategory_id" column

This campaign DataFrame is exported as "campaign.csv" under the "Resources" folder. 


**4. Create the Contacts DataFrame**

Python dictionary methods are used on the "contacts.xlsx" Excel data to create a contacts DataFrame with the following columns:

The "contact_id" column

The "first_name" column (split from the original "name" column in the Excel data file) 

The "last_name" column (split from the original "name" column in the Excel data file) 

The "email" column 


This contacts DataFrame is exported as "contacts.csv" in the "Resources" folder.


**5. Create an ERD to properly see relationships between the four data files**

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



**6. Use PostgresSQL to create four tables that will each import one of the created DataFrames.** 


The final stage involves using the four data files that were constructed in the Jupyter Notebook to be transcribed in SQL. For this purpose, four tables are created in SQL to accurately import the data from the four files. 

The first table is called "contacts", which consists of four columns: 'contact_id', 'first_name', 'last_name', and 'email'. The 'contact_id' values are classified as the primary key for this table. The 'first_name', 'last_name', and 'email' columns are classified as the VARCHAR datatype. 

The second table is called "category". This table contains two columns: 'category_id' and 'category'. The 'category_id' column is made to be the primary key for this table and the 'category' column is counted as the VARCHAR datatype. 

The third table is called "subcategory" and houses two columns: 'subcategory_id' and 'subcategory'. The 'subcategory_id' column is the primary key for this table and the 'subcategory' table is the VARCHAR datatype. 

The fourth and final table is titled "campaign" and stores several columns: 'cf_id', 'contact_id', 'company_name', 'description', 'goal', 'pledged', 'outcome', 'backers_count', 'country', 'currency', 'launched_date', 'end_date', 'category_id', and 'subcategory'. The primary key for this table is 'cf_id'. The foreign keys for this table are: 'contact_id', 'category_id', and 'subcategory_id'. The columns having a VARCHAR datatype in this table are: 'company_name', 'description', 'outcome', 'country', 'currency', 'category_id', and 'subcategory_id'. The columns with an INTEGER datatype are: 'cf_id', 'contact_id' and 'backers_count'. The 'goal' and 'pledged' columns have a DECIMAL datatype. The 'launched_date' and 'end_date' columns have a DATE datatype. 

Once all these tables are constructed in SQL, the appropriate data files are imported for each table to ultimately provide four data tables with all the values from the constructed data sets. 


