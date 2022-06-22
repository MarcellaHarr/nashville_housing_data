-- 1. View table
select *
from nashville_housing.dbo.nash_data;

--2. Change 'SaleDate' col
select SaleDate,
		convert(Date, SaleDate)
from nashville_housing.dbo.nash_data;

--3. Update 'SaleDate' col
    -- create a new column first
alter table nash_data
add SaleDates date;
 
update nash_data
set SaleDates = convert(Date, SaleDate);