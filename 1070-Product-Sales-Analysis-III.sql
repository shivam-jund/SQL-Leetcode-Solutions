with cte1 as (
    select product_id, min(year) as year
    from sales
    group by product_id
)
select c.product_id, c.year as first_year, s.quantity, s.price
from sales s
join cte1 c on c.product_id = s.product_id and c.year = s.year
order by first_year;