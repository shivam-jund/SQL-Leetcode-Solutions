-- Write your PostgreSQL query statement below
select coalesce(t1.requester_id,t2.accepter_id) as id,  coalesce(t1.num,0)+coalesce(t2.num, 0) as num 
    from
(
    select requester_id, count(*) as num
    from RequestAccepted
    group by requester_id
) as t1
full outer join
(
    select accepter_id, count(*) as num
    from RequestAccepted
    group by accepter_id
) as t2
on t2.accepter_id = t1.requester_id
order by num desc 
limit 1;