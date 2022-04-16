<?php 
	require_once 'login.php';
	echo <<<_END
<head>
	<link rel="stylesheet" href="style.css?rnd=132">
	<title> About </title>
</head>
<div id="header">
	<img src = "https://hive.sewanee.edu/makazbr0/openHands/logo.png" alt="logo" style="width:10%">
	<h1> Need a Hand? </h1>
</div>

<div class="topnav">
	<a href="index.php">HOME 	</a>
	<a href="about.html">ABOUT	</a>
	<a href="activities.php">INITIATE</a>
	<a href="addOwner.php">OWNER  </a>
	<input type="text" name="petName" placeholder="Search Activity">
	<a href="auth.html" >LOGOUT</a>
	<a href="auth.html">MY PROFILE</a>
</div>

<div id="content">
<h2> ADD ACTIVITIES </h2> <hr>
<form action="index.php" method="post">
Pet name      <input type="text" name="petName"> 
DOB           <input type="date" name="DOB"> 
DOD           <input type="date" name="DOD">
<label for="owner">Owner:</label>        <select name="owner" id="owner">
_END;
	// $query = "SELECT ownerName, ownerID FROM owner";
	// $result = $pdo->query($query);
	// while ($row = $result->fetch()){
	// 	$id = htmlspecialchars($row['ownerID']);
	// 	$name = htmlspecialchars($row['ownerName']);
	// 	echo "<option value=$id>$name</option>";
	// }
echo <<<_END
</select>
<label for="type">Pet type:</label>     <select name="type" id="type">
_END;
	// $query = "SELECT kindName, kindID FROM petKind";
	// $result = $pdo->query($query);
	// while ($row = $result->fetch()){
	// 	$id = htmlspecialchars($row['kindID']);
	// 	$name = htmlspecialchars($row['kindName']);
	// 	echo "<option value=$id>$name</option>";
	// }

echo <<<_END
</select>
</form> 
</div>
<footer>
	Footer goes here
</footer>
_END;
?>