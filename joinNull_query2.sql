-- 4. View 'OwnerName' col
	-- First let me count how many null values there are
	-- then I can view those null values for that column
select count(*)-count(OwnerName) as NullTotal
from nashville_housing.dbo.nash_data;

select *
from nashville_housing.dbo.nash_data
where OwnerName is null;

-- 5. Replacing null values in 'OwnerName' col
	-- Want to chnage null values to "Unknown", instead of "NULL"
	-- prefer to use the 'UniqueID' col becuae each null row has its
	-- own unique identifier
select UniqueID,
		OwnerName,
		coalesce(OwnerName, 'UNKNOWN NAME') as NullNameValues
from nashville_housing.dbo.nash_data;

-- 6. Update 'OwnerName' col with the replaced null vals
	-- had to use the entire database path b/c this
	-- query is post cleaned data set.
    -- typically, dbo.nash_data would have been okay
update nashville_housing.dbo.nash_data
set OwnerName = coalesce(OwnerName, 'UNKNOWN NAME');

-- 7. View 'PropertyAddress'  and 'OwnerAddress' columns
	-- Addresses are the same but for 'ownerAddress', it 
	-- includes the state abbreviations.
select PropertyAddress,
		OwnerAddress
from nashville_housing.dbo.nash_data;

-- 8. View nulls with join 'PropertyAddress' *Don't RUN AFTER UPDATE*
	-- Here, I am comparing the parcel IDs to nulls in 'PropertyAddress'
	-- If the 'OwnerAddress' column did not include the state
	-- I would've included it in this syntax. Also, the
	-- 'ParcelID' is a good anchor becuase it is unique to
	-- the property.
select nash1.ParcelID,
		nash1.PropertyAddress,
		nash2.ParcelID,
		nash2.PropertyAddress,
		isnull(nash1.PropertyAddress,
				nash2.PropertyAddress)
from nashville_housing.dbo.nash_data nash1
join nashville_housing.dbo.nash_data nash2
	on nash1.ParcelID = nash2.ParcelID
	and nash1.[UniqueID ] <> nash2.[UniqueID ]
where nash1.PropertyAddress is null;

-- 9. Update populated 'PropertyAddress' *RUN ONCE*
update nash1
set PropertyAddress = isnull(nash1.PropertyAddress,
								nash2.PropertyAddress)
from nashville_housing.dbo.nash_data nash1
join nashville_housing.dbo.nash_data nash2
	on nash1.ParcelID = nash2.ParcelID
	and nash1.[UniqueID ] <> nash2.[UniqueID ]
where nash1.PropertyAddress is null;

-- 10. View nulls with join 'OwnerAddress'
	-- Can't use the same join method from 'PropertyAddress'.
    -- will come back later to see how to address null values
    -- in this col