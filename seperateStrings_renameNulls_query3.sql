-- 11. Create new columns for  'PropertyAddress' & 'OwnerAddress'
	-- this is for when both columns are separated
alter table dbo.nash_data
add PropertyStreet nvarchar(255),
	PropertyCity nvarchar(255),
	OwnerStreet nvarchar(255),
	OwnerCity nvarchar(255),
	OwnerState nvarchar(255);

-- 12. Separating 'PropertyAddress' col
select parsename(replace(PropertyAddress, ',', '.'), 2) as PropertyStreet,
		parsename(replace(PropertyAddress, ',', '.'), 1) as PropertyCity
from nashville_housing.dbo.nash_data;

-- 13. Update separated 'PropertyAddress' col
update dbo.nash_data
set PropertyStreet = parsename(replace(PropertyAddress, ',', '.'), 2),
	PropertyCity = parsename(replace(PropertyAddress, ',', '.'), 1);

-- 14. Separating 'OwnerAddress' col
select parsename(replace(OwnerAddress, ',', '.'), 3) as OwnerStreet,
		parsename(replace(OwnerAddress, ',', '.'), 2) as OwnerCity,
		parsename(replace(OwnerAddress, ',', '.'), 1) as OwnerState
from nashville_housing.dbo.nash_data;

-- 15. Update separated 'OwnerAddress' col
update dbo.nash_data
set OwnerStreet = parsename(replace(OwnerAddress, ',', '.'), 3),
	OwnerCity = parsename(replace(OwnerAddress, ',', '.'), 2),
	OwnerState = parsename(replace(OwnerAddress, ',', '.'), 1);

-- 16. Update  seperated 'OwnerAddress' col with the replaced null vals
	-- had to use the entire database name and table b/c this
	-- query is post save.
    -- 'OwnerStreet'
update nashville_housing.dbo.nash_data
set OwnerStreet = coalesce(OwnerStreet, 'STREET UNKNOWN');

-- 17. Upadte replaced null vals for 'OwnerCity' col
update nashville_housing.dbo.nash_data
set OwnerCity = coalesce(OwnerCity, 'CITY UNKNOWN');

-- 18. Upadte replaced null vals for 'OwnerState' col
	-- replace null values with "TN" b/c this is for the state of Tennessee
update nashville_housing.dbo.nash_data
set OwnerState = coalesce(OwnerState, 'TN');

-- 19. View table
select *
from nashville_housing.dbo.nash_data;