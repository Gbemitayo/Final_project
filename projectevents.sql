Show databases;

use project;
show tables;

--- select all from actions2load

select * from actions2load;

---- count of all data in the table ----

select count(*) from actions2load;

--- count of distinct event_type---

select  count(distinct (event_type))  from actions2load;

select distinct (event_type) from actions2load;

---- The most common events----

SELECT 
    event_type, COUNT(event_type) AS event_count
FROM
    actions2load
GROUP BY event_type
ORDER BY event_count DESC;

---- The least common events----

SELECT 
    event_type, COUNT(event_type) AS event_count
FROM
    actions2load
GROUP BY event_type
ORDER BY event_count ASC;

---- account_id with the highest number of events ----

select account_id, event_type, count(event_type) as event_type_count
from actions2load
group by account_id, event_type
order by event_type_count desc;

---- account_id with the least number of events ----

select account_id, event_type, count(event_type) as event_type_count
from actions2load
group by account_id, event_type
order by event_type_count asc;

use project;
-- How many times event occured based on different times of the day---

SELECT 
    DATE_FORMAT(event_time, '%H:%i') AS time_of_the_day,
    COUNT(*) AS event_count
FROM
    actions2load
GROUP BY time_of_the_day
ORDER BY time_of_the_day;

SELECT 
    event_type,
    DATE_FORMAT(event_time, '%H:%i') AS time_of_the_day,
    COUNT(event_type) AS event_count
FROM
    actions2load
GROUP BY time_of_the_day , event_type
ORDER BY time_of_the_day;

-- How many times event occured based on days of the week---

SELECT 
    event_type,
    DAYNAME(event_time) AS day_of_week,
    COUNT(event_type) AS event_count
FROM
    actions2load
GROUP BY day_of_week , event_type
ORDER BY day_of_week, event_count DESC;

