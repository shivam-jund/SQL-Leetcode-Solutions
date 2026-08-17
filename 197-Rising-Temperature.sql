select w1.id as Id
from Weather w1 
join Weather w2 
on w1.recordDate = w2.recordDate + INTERVAL '1 day'
where w1.temperature > w2.temperature ;
