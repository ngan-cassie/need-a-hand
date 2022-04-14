<?php 
	require_once 'login.php';
		echo <<<_END
<title>Add Owner </title>
<link rel="stylesheet" href="style.css">
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
<div id="content">
<pre><h2> ADD OWNER </h2> <hr>
<form class="form" action="index.php" method="post">
Full name     <input type="text" name="fullName">
House number  <input type="text" name="houseNo">
Street name   <input type="text" name="street">
<input type="submit" value="ADD OWNER">
</pre></form>
</div>
<div id="footer">
	Footer goes here
</div>
_END;
?>