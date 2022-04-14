#-------------------------------------------------------------------------------
# 1.) 5 volunteers with the most hours 
#-------------------------------------------------------------------------------

SELECT volunteer_time.userid,
       Sum(hours) AS total_hours
FROM   (SELECT userid,
               activity.activityid AS aid,
               hours
        FROM   user,
               activity,
               who_volunteers_where
        WHERE  user.userid = who_volunteers_where.volunteerid
               AND who_volunteers_where.activityid = activity.activityid) AS
       volunteer_time
GROUP  BY userid
ORDER  BY total_hours DESC
LIMIT  5;

#-------------------------------------------------------------------------------
# 2.) How many organizations held agriculture volunteer activities
#-------------------------------------------------------------------------------
SELECT Count(userid) AS org
FROM   user,
       activity,
       who_organizes_what,
       type_of_activity
WHERE  who_organizes_what.activityid = activity.activityid
       AND user.userid = who_organizes_what.organizerid
       AND activity.typeid = type_of_activity.typeid
       AND type_of_activity.NAME = "agriculture"; 



#-------------------------------------------------------------------------------
# 3.) How many activities in Sewanee are there that have more than 1 volunteers
#-------------------------------------------------------------------------------

SELECT Count(activity.activityid)
FROM   (SELECT activityid,
               Count(volunteerid) AS cnt
        FROM   who_volunteers_where
        GROUP  BY activityid) AS x,
       activity,
       location
WHERE  x.activityid = activity.activityid
       AND activity.locationid = location.locationid
       AND location.address = "sewanee"
       AND x.cnt > 1; 

#-------------------------------------------------------------------------------
# 4.) List all one-hours activities related to wellness
#-------------------------------------------------------------------------------
SELECT title,
       hours
FROM   activity,
       type_of_activity
WHERE  activity.typeid = type_of_activity.typeid
       AND type_of_activity.NAME = "wellness"
       AND activity.hours = 1; 


#-------------------------------------------------------------------------------
# 5.) List activities that have fundraise or donate in their title and need more 
#	  than 2 volunteers
#-------------------------------------------------------------------------------
SELECT *
FROM   activity
WHERE  ( Lower(title) LIKE "%donate%"
          OR Lower(title) LIKE "%fundraise%" )
       AND numvolneeded > 2; 

#-------------------------------------------------------------------------------
# 6.) How many volunteers share the same last name and the same 
#	  type of activities
#-------------------------------------------------------------------------------
-- select count(volunteerID) from who_volunteers_where, activity, type_of_activity, user where user.username = who_volunteers_where.volunteerID and who_volunteers_where.activityID = activity.activityID and type_of_activity.typeID = activity.typeID group by lastName;

-- # share the same last name
-- select  from (select count(userID) as cnt, lastName from user  where cnt > 1 group by lastName)) as c1,
-- (select activityID from activity group by typeID having count(*) > 1) as c2;

SELECT Count(userid) AS cnt,
       lastname
FROM   who_volunteers_where,
       activity,
       type_of_activity,
       user
WHERE  user.username = who_volunteers_where.volunteerid
       AND who_volunteers_where.activityid = activity.activityid
       AND type_of_activity.typeid = activity.typeid
GROUP  BY lastname; 


