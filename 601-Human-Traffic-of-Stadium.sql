-- Write your PostgreSQL query statement below
with filtered as (
    select 
        id,
        visit_date,
        people,
        id - row_number() over (order by id) as grp
    from Stadium
    where people >= 100
),
grouped as (
    select 
        id,
        visit_date,
        people,
        count(*) over (partition by grp) as cnt
    from filtered
)
select 
    id,
    visit_date,
    people
from grouped
where cnt >= 3
order by visit_date;