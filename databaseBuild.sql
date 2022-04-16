drop database if exists needAHand;
create database needAHand;
use needAHand;

GRANT select, insert ON needAHand.*  TO 'guest'@'%'	IDENTIFIED BY 'icecream';
FLUSH privileges;
#---------------------------------------------------------------------------------

create table user (
	 userID 	 		int AUTO_INCREMENT NOT NULL PRIMARY KEY
	,userName			varchar(32)
	,email				varchar(64)
	,firstName			varchar(32)
	,lastName 			varchar(32)
	,password	 		varchar(10)
);


create table activity(
	 activityID 		int AUTO_INCREMENT NOT NULL PRIMARY KEY
	,typeID 			int 		NOT NULL
	,title 				varchar(32) NOT NULL
	,locationID 		int 
	,numVolNeeded 		int 
	,hours 				int 
	,description 		varchar(128) 
	,imageURL 			varchar(200)
	,isOutdoor 			boolean
	,startTime			int
	,schedule			varchar(5)
);

create table type_of_activity(
	 typeID  		int AUTO_INCREMENT NOT NULL PRIMARY KEY
	,typeName 		varchar(64) NOT NULL
);

create table location(
	locationID 		int AUTO_INCREMENT NOT NULL PRIMARY KEY
	,locationName 	varchar(64) NOT NULL
	,address 		varchar(64) NOT NULL
);


create table who_volunteers_where(
	 ID 			int AUTO_INCREMENT NOT NULL PRIMARY KEY
	,volunteerID 	int 
	,activityID 	int 

);

create table who_organizes_what(
	 ID 			int AUTO_INCREMENT NOT NULL PRIMARY KEY
	,organizerID 	int 
	,activityID 	int 

);
#----------------------------------------------------------------------------

INSERT INTO user
            (username,email,firstname,lastname,password)
VALUES      ('BlueMonarch','BlueMonarch@gmail.com','Blue Monarch','','8609'),
            ('BonnerNCanaleVideo','BonnerNCanaleVideo@gmail.com','Bonner and Canale Videography','','6025'),
            ('CommunityActionCommittee','CommunityActionCommittee@gmail.com','Community Action Committee','','942'),
            ('DiabetesPrevention','DiabetesPrevention@gmail.com','Diabetes Prevention Program','','3840'),
            ('FolksAtHome','FolksAtHome@gmail.com','Folks at Home','','3193'),
            ('HeritageTrail','HeritageTrail@gmail.com','Heritage Trail','','4585'),
            ('HospitalityShop','HospitalityShop@gmail.com','Hospitality Shop','','9194'),
            ('HousingSewanee','HousingSewanee@gmail.com','Housing Sewanee','','397'),
            ('NewLife','NewLife@gmail.com','New Life','','6656'),
            ('Partners4Healing','Partners4Healing@gmail.com','Partners for Healing','','3307'),
            ('RootedHere','RootedHere@gmail.com','Rooted Here','','2443'),
            ('SewaneePublicHealth','SewaneePublicHealth@gmail.com','Sewanee Public Health','','5190'),
            ('UniversityFarm','UniversityFarm@gmail.com','University Farm','','9074'),
            ('bulloml0','bulloml0@sewanee.edu','Lou Bullock - Louis','Smith','9789'),
            ('vickrae0','vickrae0@sewanee.edu','Vickrey','Smith','1223'),
            ('romince0','romince0@sewanee.edu','Clara Rominger','Smith','4877'),
            ('diazsca0','diazsca0@sewanee.edu','Cris Diaz-Santos','Smith','311'),
            ('torrego0','torrego0@sewanee.edu','Gennessee Torres','Smith','8542'),
            ('silvaae0','silvaae0@sewanee.edu','Adri Silva','Smith','8766'),
            ('congeeh0','congeeh0@sewanee.edu','Betsy Conger','Smith','6032'),
            ('keukc0','keukc0@sewanee.edu','Nita Keuk','Smith','3662'),
            ('bakerct0','bakerct0@sewanee.edu','Cole Baker','Smith','2036'),
            ('turnedl0','turnedl0@sewanee.edu','Delana Turner','Smith','923'),
            ('carten0','carten0@sewanee.edu','Nevena','Smith','3896'),
            ('Acostjm0','Acostjm0@sewanee.edu','Joseph','Smith','1489'),
            ('bailetw0','bailetw0@sewanee.edu','Wes','Smith','999'),
            ('pouder0','pouder0@sewanee.edu','Roshan','Smith','8093'),
            ('manacjs0','manacjs0@sewanee.edu','Jaden','Smith','8349'),
            ('fisheew0','fisheew0@sewanee.edu','Elizabeth','Smith','6871'),
            ('lehm0','lehm0@sewanee.edu','Hoang','Smith','8672'); 


INSERT INTO type_of_activity(typeName) VALUES 
	 ("wellness")
	,("arts")
	,("professional")
	,("agriculture")
	,("other")
	;

INSERT INTO activity (typeID,title,locationID,numVolNeeded,isOutdoor, startTime, hours, schedule, imageURL) VALUES
	 (5, "Fundraise for housing", 4, 9, TRUE, 11, 4, "MWF", "https://images.squarespace-cdn.com/content/v1/59ca33c0f09ca4a9c58455a9/1513198446747-DSMJPRB4Z7NU0VUMRDFX/4April_FairHousingMonth-e1474527313689.jpg?format=1000w")
	,(2, "Site filming", 9, 1, TRUE, 13, 4, "MWF", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(5, "Financial Planning", 10, 9, TRUE, 10, 3, "MWF", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(5, "Workshop facilitation", 4, 4, TRUE, 16, 3, "MWF", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(3, "Job Training", 8, 10, TRUE, 13, 2, "MWF", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(5, "Lead an outing trip", 4, 8, FALSE, 13, 2, "TR", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(4, "Plant trees", 2, 5, FALSE, 13, 3, "TR", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(3, "Reception", 6, 5, FALSE, 16, 4, "TR", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(3, "Paint houses", 7, 4, FALSE, 10, 2, "TR", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(1, "Healthy cooking", 10, 10, FALSE, 11, 3, "TR", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(1, "Yoga", 5, 10, TRUE, 14, 2, "TR", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(4, "Deliver products", 3, 1, TRUE, 10, 4, "TR", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(1, "HIV/AIDS ", 7, 1, TRUE, 13, 1, "SS", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(4, "Pick flowers", 8, 10, TRUE, 10, 3, "SS", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(5, "Donate clothes and accessories", 6, 9, TRUE, 14, 2, "SS", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
	,(5, "Donate blood", 9, 3, TRUE, 11, 2, "SS", "https://www.thoughtco.com/thmb/mik7Z00SAYN786BQbieXWOzZmc8=/2121x1414/filters:fill(auto,1)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg")
;

INSERT INTO location (locationName, address) VALUES 
	 ("Quad", "Sewanee")
	,("Centennial Park", "Nashville")
	,("Farmers Market", "Nashville")
	,("Gazebo", "Cowan")
	,("Spencer Quad", "Sewanee")
	,("Hospitality Shop", "Sewanee")
	,("Library", "Sewanee")
	,("Piggy", "Monteagle")
	,("Community Center", "Monteagle")
	,("Social Lodge", "Sewanee")
	,("University Farm", "Sewanee")
	;

INSERT INTO who_volunteers_where (volunteerID, activityID) VALUES 
     (30,	5)
	,(18,	12)
	,(20,	14)
	,(22,	6)
	,(24,	10)
	,(15,	7)
	,(21,	4)
	,(30,	14)
	,(18,	1)
	,(26,	4)
	,(25,	2)
	,(24,	3)
	,(26,	3)
	,(24,	2)
	;

INSERT INTO who_organizes_what (organizerID, activityID) VALUES 
   (1	,1)
  ,(2	,2)
  ,(3	,3)
  ,(4	,4)
  ,(5	,5)
  ,(6	,6)
  ,(7	,7)
  ,(8	,8)
  ,(9	,9)
  ,(10	,10)
  ,(11	,11)
  ,(12	,12)
  ,(13	,13)
  ,(14	,14)
  ;