# Nashville Housing Dataset

![Photo compiled together](/images/tenneesee_map_cleaned.png)

This project includes a collection of SQL queries created and executed in SQL Server Management Studio 2018. The purpose of this project is to practice different SQL queries to clean the data set for better performance.

## The Data

I obtained this data set from `AlexTheAnalyst` on `GitHub.com` as part of Alesx's, Data Analyst Portfolio Project. It has been downloaded on an external thumbdrive and structured in folders. The data set contains the following columns:

- UniqueID
- ParcelID
- LandUse
- PropertyAddress
- SaleDate
- SalePrice
- LegalReference
- SoldVacant
- OwnerName
- OwnerAddress
- Acreage
- TaxDistrict
- LandValue
- BuildingValue
- TotalValue
- YearBuilt
- Bedrooms
- FullBath
- HalfBath


## In Microsoft Excel
The data set opened in Excel with columns of 18 "General" and 1 "Date (April 9, 2013)" data type. All general columns are in caps and the month name in the date column is in title case. There are 19 columns total and 56,477 rows not including the header. For the `SoldAsVacant` column there are No, N, Yes, and Y responses. Null values are heavy in the following columns:

- OwnerName
- OwnerAddress
- Acreage
- TaxDistrict
- LandValue
- BuildingValue
- TotalValue
- YearBuilt
- Bedrooms
- FullBath
- HalfBath 


## In SQL Server
Unfortunately, I didn't notate the initial data type for the columns, the total of nulls or count of distinct values. I have split my queries into multiple files for categorzing as specific tasks.

Post cleaned, there are a total of 21 columns and 56,477 rows not including the header.

To see more of my work, please visit my portfolio at: [Data-Folio](https://marcellaharr.github.io/portfolio/).

### Thank you!