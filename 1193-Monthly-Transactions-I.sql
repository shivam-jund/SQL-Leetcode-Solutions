-- Write your PostgreSQL query statement below
with cte1 as (
    select TO_CHAR(trans_date, 'YYYY-MM') AS year_month,country, count(*) as trans_count, sum(amount) as trans_total_amount
    from Transactions
    group by country, TO_CHAR(trans_date, 'YYYY-MM')
),
cte2 as (
    select TO_CHAR(trans_date, 'YYYY-MM') AS year_month,country, count(*) as approved_count, sum(amount) as approved_total_amount
    from Transactions
    WHERE state = 'approved'
    group by country, TO_CHAR(trans_date, 'YYYY-MM')
)
select c1.year_month as month, c1.country,c1.trans_count, coalesce(c2.approved_count,0) as approved_count, c1.trans_total_amount, coalesce(c2.approved_total_amount,0) as approved_total_amount
from cte1 c1
left join cte2 c2 ON c1.year_month = c2.year_month
AND c1.country IS NOT DISTINCT FROM c2.country;