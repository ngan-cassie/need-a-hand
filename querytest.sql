use needAHand;

SELECT * 
FROM activity, type_of_activity, location, who_organizes_what
WHERE activity.activityID =	who_organizes_what.activityID 
AND activity.locationID = location.locationID
AND type_of_activity.typeid = activity.typeid
;