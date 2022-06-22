-- 20. View 'SoldAsVaccant' col
	-- There are No/N and Yes/Y resposnses, but I prefer there to be 
	-- Yes and No.
select distinct SoldAsVacant,
		count(SoldAsVacant) as ResponseTotal
from nashville_housing.dbo.nash_data
group by SoldAsVacant
order by SoldAsVacant;

-- 21. Combine like responses in 'SoldAsVacant' col
select SoldAsVacant,
case 
    when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	else SoldAsVacant
end
from nashville_housing.dbo.nash_data;

-- 22. Update to the original 'SoldAsVacant' col
update nash_data
set SoldAsVacant = case when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	else SoldAsVacant
	end
from nashville_housing.dbo.nash_data;