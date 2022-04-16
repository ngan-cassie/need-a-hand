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
<h2> ADD OWNER </h2> <hr>
<form class="form" action="index.php" method="post">
Full name     <input type="text" name="fullName">
House number  <input type="text" name="houseNo">
Street name   <input type="text" name="street">
<input type="submit" value="ADD OWNER">
</form>
</div>
<footer>
	Footer goes here
</footer>
_END;
?>