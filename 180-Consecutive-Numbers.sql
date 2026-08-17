-- Write your PostgreSQL query statement below
with cte1 as (
    select id,num,lag(num,1,0) over (order by id) as lag1,
    lag(num,2,0) over (order by id) as lag2
    from logs
)
select distinct num as ConsecutiveNums
from cte1 as c1
where c1.lag1 = c1.lag2 and c1.lag1 = c1.num;