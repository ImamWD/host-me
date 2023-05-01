<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/signup.css">
    
    <title>signup</title>
</head>
<body>
    
    <div id="login-box">
        <div class="left ">
          <h1>Sign up</h1>
            <input class="form-control"  type="text" id="name" placeholder="Username" onkeyup="validation(this ,0)" />
            <p id="name_msg" class="ERER" ></p>
            <input class="form-control" type="text" id="email" placeholder="E-mail"  onkeyup="validation(this ,1)" />
            <p id="email_msg" class="ERER" ></p>
            <input class="form-control" type="password" id="password" placeholder="Password"  onkeyup="validation(this ,2)" />
            <p id="password_msg" class="ERER" ></p>
            <input class="form-control" type="password" id="config_pass" placeholder="Retype password"  onkeyup="validation(this ,3)" />
            <p id="config_msg" class="ERER" ></p>
            <input class="form-control" type="text" id="location" placeholder="Location(Optional)"  onkeyup="validation(this ,4)" />
            <p id="location_msg" class="ERER" ></p>
            <input class="form-control" type="text" id="phone" placeholder="Phone(Optional)"  onkeyup="validation(this ,5)" />
            <p id="phone_msg" class="ERER" ></p>
            <input type="file" id="image" onchange="validation(this ,6)" />
            <p id="image_msg" class="ERER" ></p>
            <div class="btns">
              <button id="submit-btn" class="btn login disabled" style="background-color:#16a085 ; color:white" onclick="signupUser()" >Sign Up </button>
              <a href="/"  class="btn login" name="signup_submit" > Login </a>
            </div>
       
        </div>
        
        <div class="right ">
          <span class="loginwith">Sign in with<br />social network</span>
          
          <button class="social-signin facebook">Log in with facebook</button>
          <button class="social-signin twitter">Log in with Twitter</button>
          <button class="social-signin google">Log in with Google+</button>
        </div>
        <div class="or">OR</div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

      <script src="/js/signup.js"> </script>

</body>
</html>