
<head> 
  <title> Login </title>
</head>
<body>
<style>

  form {
      border-radius: 5px;
      padding: 20px;
      display: block;
      margin-left: 200px;
      margin-right:200px;
      text-align:center;
  }
  
  input {
      width: 50%;
      padding: 12px 20px;
      margin: 8px 0;
      border-radius: 4px;
  }
  input[type=submit] {
    background-color:#34495e;
    color: white;
    width: 25%;
  }
</style>


  <form method="post" action="index.php">
	 <img src = "https://hive.sewanee.edu/makazbr0/openHands/logo.png" alt="logo" style="width:15%">
    <h1 style="color: #34495e;"> Need a Hand? </h1>
    <input type="text" name="userName" placeholder="userName">
    <input type="password" name="password" placeholder="Password">
    <p> By using this platform, you agree to abide by the University of the South's Network and Computer Use Policy.
    </p>
    <input type="submit" value="Sign In">
  </form>

</body>
