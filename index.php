<?php 
	require_once 'login.php';
	//header("Location: auth.html");

	echo <<<_END
<head>
<link rel="stylesheet" href="style.css?rnd=132">
</head>
<div id="header">

	<img src = "https://hive.sewanee.edu/makazbr0/openHands/logo.png" alt="logo" style="width:10%">
	<h1> Need a Hand? </h1>
</div>


<div id="content">

<div class="topnav">
	<a href="index.php">HOME 	</a>
	<a href="about.html">ABOUT	</a>
	<a href="activities.php">INITIATE</a>
	<a href="addOwner.php">OWNER  </a>
	<a href="refs.html"> REFS </a>
	<a href="auth.html" style="float:right">LOGOUT</a>
	<a href="auth.html" style="float:right">MY PROFILE</a>

	<input type="text" name="petName" placeholder="Search Activity">
</div>
_END;
	if (isset($_POST['delete_pet'])) {
		$id = get_post($pdo, 'delete_pet_id');
		$name = get_post($pdo, 'delete_pet');
		$query = "DELETE FROM pet WHERE petID = $id";
		$result = $pdo->query($query);
		$query = "DELETE FROM ownership WHERE petID = $id";
		$result = $pdo->query($query);
		echo "<div class='message'>Success. Pet $name is deleted. Forever.";
		echo "<br>";
		echo "<form id='okay' action='index.php' method='post'><input type='submit' value='OKAY'></form></div>";
	} 
// ADD OWNER TO DB_________________________________________________________________________________________________________________________
	if (isset($_POST['fullName']) 
	&&  isset($_POST['street']) 
	&&  isset($_POST['houseNo'])) {
		$name     = get_post($pdo, 'fullName');
		$street   = get_post($pdo, 'street');
		$house    = get_post($pdo, 'houseNo');
		echo <<<_END
<div class="message">
_END;
		if ($name == "" | $street == "" | $house == "" ) {
			echo "At least one of the entries was left empty. Fail to add owner.";
			echo "<br>";
		} else {
			$query = "INSERT INTO owner (ownerName, house, street) VALUES ('$name', '$house', '$street')";
			$result = $pdo->query($query);
			echo "Success. Pet owner $name at $house $street has been added to owner database";
			echo "<br>";
		}
		echo "<form id='okay' action='index.php' method='post'><input type='submit' value='OKAY'></form></div>";
	}
	echo "<pre><h2> VOLUNTEER ACTIVITIES </h2></pre>";
//--------------------------------------------------------------------------------------------
  if  (isset($_POST['userName']) 
  &&  isset($_POST['password'])) {
    $userName  = get_post($pdo, 'userName');
    $password   = get_post($pdo, 'password');
    
  }
// ADD PET TO DB_________________________________________________________________________________________________________________________
	if (isset($_POST['owner']) 
	&&  isset($_POST['type'])
	&&  isset($_POST['DOD'])
	&&  isset($_POST['DOB']) 
	&&  isset($_POST['petName'])) {
		$owner  = get_post($pdo, 'owner');
		$type   = get_post($pdo, 'type');
		$DOD    = get_post($pdo, 'DOD');
		$DOB    = get_post($pdo, 'DOB');
		$petName    = get_post($pdo, 'petName');
echo <<<_END
<div class="message">
_END;
		if ($DOD == "" | $DOB == "" | $petName == "" ) {
			echo "At least one of the entries was left empty. Fail to add pet.";
			echo "<br>";
		} else {
			$query = "INSERT INTO pet (kindID, DOB, DOD, petName) VALUES ($type, '$DOB', '$DOD', '$petName')";
			$result = $pdo->query($query);
			$lastId = $pdo->query("SELECT LAST_INSERT_ID()")->fetchColumn();
			$query = "INSERT INTO ownership (ownerID, petID) VALUES ($owner, $lastId)";
			$result = $pdo->query($query);
			echo "Success. $petName has been added to pet database";
			echo "<br>";
		}
		echo "<form id='okay' action='index.php' method='post'><input type='submit' value='OKAY'></form></div>";
	}

// LIST ALL PETS_________________________________________________________________________________________________________________________
	$query = "SELECT * 
FROM activity, type_of_activity, location
WHERE activity.locationID = location.locationID
AND type_of_activity.typeid = activity.typeid
";
	$result = $pdo->query($query);
	while ($row = $result->fetch())
	{
	$title = htmlspecialchars($row['title']);
	$locationName = htmlspecialchars($row['locationName']);
	$address = htmlspecialchars($row['address']);
	$startTime = htmlspecialchars($row['startTime']);
	$imgURL = htmlspecialchars($row['imageURL']);
	$schedule = htmlspecialchars($row['schedule']);
	$type = htmlspecialchars($row['typeName']);
	$numVolNeeded = htmlspecialchars($row['numVolNeeded']);
	echo <<<_END
<div class="profile">
<img class="thumbnail" src= $imgURL>
<h3>$title</h3>
Location: $locationName, $address<br>
Schedule: $startTime:00 $schedule<br>
Type: $type<br>
Description: description<br>
Number of Volunteers: $numVolNeeded
<form action='index.php' method='post'>
<input type='hidden' name='delete_pet_id' value='$id'>
<input type='hidden' name='delete_pet' value=$r0>
<input type='submit' value='ENROLL'></form>
</div>
_END;
}

echo <<<_END
</div>
<footer>
	Footer goes here
</footer>
_END;
	function get_post($pdo, $var) {
	return substr($pdo->quote($_POST[$var]), 1, -1);
	}
?>	

