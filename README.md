# ETL_Project
Summary: For the ETL mini project, we worked with our project partners Chris Kilkes, Palash Raval and Divya Govil to practice building an ETL pipeline using Python, Pandas, and either Python dictionary methods or regukar expressions to extract and transform the data. We chose to complete option 1. After we transformed the data, we created four CSV files and usef the CSV file data to create an ERD and a table schema. Finally, we uploaded  the CSV file data into a Postgres database.

The instructions for this mini project are divided into the following subsections:

# Create the Category and Subcategory DataFrames
1. get a brief summafy of the Crowdfunding Database
2. Create the Category and Subcategory DataFrames
Extract and transform the crowdfunding.xlsx Excel data to create a category DataFrame that has the following columns:

A "category_id" column that has entries going sequentially from "cat1" to "catn", where n is the number of unique categories

A "category" column that contains only the category titles

The following image shows this category DataFrame:
![image](https://github.com/palraval/ETL_Project/assets/157430192/d67fa2c8-e42e-4128-8e37-7e22a9750aaa)

3. Export the category DataFrame as category.csv and save it to the GitHub repository.

4. Extract and transform the crowdfunding.xlsx Excel data to create a subcategory DataFrame that has the following columns:

A "subcategory_id" column that has entries going sequentially from "subcat1" to "subcatn", where n is the number of unique subcategories

A "subcategory" column that contains only the subcategory titles

The following image shows this subcategory DataFrame:
![image](https://github.com/palraval/ETL_Project/assets/157430192/d264e367-66ba-4c8a-bd1d-59e95b6bae7d)
5. Export the subcategory DataFrame as subcategory.csv and save it to GitHub repository.

# Create the Campaign DataFrame
1. Extract and transform the crowdfunding.xlsx Excel data to create a campaign DataFrame has the following columns:

The "cf_id" column

The "contact_id" column

The "company_name" column

The "blurb" column, renamed to "description"

The "goal" column, converted to the float data type

The "pledged" column, converted to the float data type

The "outcome" column

The "backers_count" column

The "country" column

The "currency" column

The "launched_at" column, renamed to "launch_date" and with the UTC times converted to the datetime format

The "deadline" column, renamed to "end_date" and with the UTC times converted to the datetime format

The "category_id" column, with unique identification numbers matching those in the "category_id" column of the category DataFrame

The "subcategory_id" column, with the unique identification numbers matching those in the "subcategory_id" column of the subcategory DataFrame

The following image shows this campaign DataFrame:
![image](https://github.com/palraval/ETL_Project/assets/157430192/edda2502-21de-4a0b-90c9-c2126e4d330b)
2. Export the campaign DataFrame as campaign.csv and save it to the GitHub repository.

# Create the Contacts DataFrame

1. Choose one of the following two options for extracting and transforming the data from the contacts.xlsx Excel data:

Option 1: Use Python dictionary methods.

2. Complete the following steps:
  Import the contacts.xlsx file into a DataFrame.
  **Iterate through the DataFrame, converting each row to a dictionary.
- To accomplish this we initialized a List: dict_values = [] initializes an empty list where dictionaries created from each row will be stored.
- Loop Through DataFrame: The loop for index, row in contact_info_df[1:].iterrows(): iterates over the rows of the DataFrame contact_info_df, starting from the second row (since Python indexing starts at 0, contact_info_df[1:] skips the first row). The iterrows() function is used to loop through the DataFrame rows as index and series pairs.
- new_dict = {}: Initializes a new dictionary for each row.
- data = row[0].split(","): Assumes that each row has its data in the first column (row[0]) and splits this data by commas into components, which should correspond to key-value pairs in the string.
- Split Key-Value Pairs:
Within the loop iterating over data, each item (assumed to be in the format "key: value") is further split into a key and value using item.split(": ").
- The key is cleaned by removing curly braces ({ and }), excess spaces, and quotation marks. Similarly, value is cleaned by removing the same characters.
- Add to Dictionary: Each cleaned key and value is then added to the new_dict dictionary with new_dict[key] = value.
- Append Dictionary to List: After all key-value pairs in a row are processed and added to new_dict, the dictionary is appended to the dict_values list.
- Print the Result: Finally, print(dict_values) prints out the list of dictionaries, each corresponding to a row in the original DataFrame.
   
   **Create a new DataFrame that contains the extracted data.
   To accomplish this we completed the following steps:
  - Create an Empty DataFrame:
contact_info_df_new = pd.DataFrame(): This line initializes an empty DataFrame called contact_info_df_new. This will be the DataFrame to which rows are added.
- Loop Through the List of Dictionaries:
for row in dict_values:: This loop iterates through each dictionary in the list dict_values. Each dictionary (row) is expected to represent one row of data, with keys and values corresponding to column names and cell data, respectively.
- Convert Dictionary to DataFrame:
row_df = pd.DataFrame([row]): For each dictionary, a new DataFrame row_df is created with the dictionary as its data. The dictionary is enclosed in a list ([row]) because when initializing a DataFrame with a dictionary, placing the dictionary inside a list tells pandas to treat the dictionary as a single row of data. The keys of the dictionary become the column headers, and the values become the row's data.
- Concatenate DataFrames:
contact_info_df_new = pd.concat([contact_info_df_new, row_df], ignore_index=True): This line concatenates the current row_df with the existing contact_info_df_new. The ignore_index=True parameter is crucial because it reindexes the DataFrame after each concatenation. Without this, the index of each row_df would always start at 0, leading to duplicate indices in contact_info_df_new.
- The loop continues until all dictionaries in dict_values have been converted to DataFrame rows and concatenated to contact_info_df_new.


   **Split each "name" column value into a first and last name, and place each in a new column.
- contact_info_df_new['name'].str.split(" ", expand=True)
This part takes the 'name' column from the contact_info_df_new DataFrame.
- The .str accessor is used to apply string methods to pandas Series.
.split(" ") is a string method that splits each name into a list where spaces occur. This is assuming that the first name and last name in the 'name' column are separated by a space.
- The expand=True parameter tells pandas to split the lists into separate columns. 
contact_info_df_new[['first_name', 'last_name']] = ...
This part takes the result of the split and assigns it to two new columns in the contact_info_df_new DataFrame, 'first_name' and 'last_name'.
- Since the split operation returns a DataFrame with two columns (because of expand=True), the first column of the result (which contains the first names) is assigned to the 'first_name' column of contact_info_df_new, and the second column (which contains the last names) is assigned to the 'last_name' column.
- The end result is that contact_info_df_new retains its original columns and gains two more columns, one for the first name and one for the last name, populated from the split 'name' colum

  ** Clean and export the DataFrame as contacts.csv and save it to the GitHub repository

4. Check that your final DataFrame resembles the one in the following image:
![image](https://github.com/palraval/ETL_Project/assets/157430192/c5bbef14-b5df-40ee-a291-6292d5b05415)

