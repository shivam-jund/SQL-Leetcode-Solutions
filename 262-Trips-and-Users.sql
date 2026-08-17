select t.request_at as day, round(sum(case when t.status != 'completed' then 1 else 0 end)::numeric/count(*),2) as "Cancellation Rate"
from trips t
join users u1 on u1.users_id = t.driver_id 
join users u2 on u2.users_id = t.client_id 
where t.request_at <= '2013-10-03' and t.request_at >= '2013-10-01' and u1.banned = 'No' and u2.banned = 'No'
group by t.request_at ;