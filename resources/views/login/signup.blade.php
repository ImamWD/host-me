<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/signup.css">

    <title>signup</title>
</head>
<body>
    
    <div id="login-box">
        <div class="left ">
          <h1>Sign up</h1>
            <input type="text" id="name" placeholder="Username" />
            <input type="text" id="email" placeholder="E-mail" />
            <input type="password" id="password" placeholder="Password" />
            <input type="password" id="config_pass" placeholder="Retype password" />
            <input type="text" id="location" placeholder="Location" />
            <input type="text" id="phone" placeholder="Phone" />
            <input type="file" id="image" />
            <div class="btns">
              <button onclick="signupUser()" >Sign Up </button>
              <a href="/"  class="login" name="signup_submit" > Login </a>
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
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
      <script src="/js/signup.js"> </script>

</body>
</html>