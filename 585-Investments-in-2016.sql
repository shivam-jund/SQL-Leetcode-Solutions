select round(sum(tiv_2016)::numeric,2)as tiv_2016
from insurance 
where (lat, lon) in (
        SELECT i1.lat, i1.lon
        FROM insurance i1
        GROUP BY i1.lat, i1.lon
        HAVING COUNT(*) = 1
    )
and
tiv_2015 in (
    select i2.tiv_2015
    from insurance i2
    group by i2.tiv_2015 
    having count(*) > 1
);