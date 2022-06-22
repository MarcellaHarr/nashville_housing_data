-- 23. View duplicates & create a CTE
with RowNumCTE as (
	select *,
		row_number() over(partition by 
							ParcelID,
							PropertyAddress,
							SalePrice,
							SaleDate,
							LegalReference
						order by UniqueID) row_num
	from nashville_housing.dbo.nash_data
)
select *
from RowNumCTE
where row_num > 1;

-- 24. View table
select *
from nashville_housing.dbo.nash_data;