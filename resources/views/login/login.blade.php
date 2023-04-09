<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/login.css">
    <title>Document</title>
</head>
<body>


  <div class="container">
    <div class="formBox level-login">
      <div class="box boxShaddow"></div>
      <div class="box loginBox">
        <h2>LOGIN</h2>
        <form class="form" id="login-form">
        @csrf
          <div class="f_row">
            <label id="email-label">Email</label>
            <input style="color:#16a085;" onkeyup="validation(this,0)" type="text" class="input-field" name="" id="email" required>
            <u></u>
          </div>
          <div class="f_row last">
            <label id="password-label" >Password</label>
            <input  style="color:#16a085;" onkeyup="validation(this,1)" type="password" class="input-field" name="" id="password" required>
            <u></u>
          </div>
          <h6 id="Error" style=" color:red; text-align:center "></h6>
          <button  id="login-btn" class="btn disabled"><span>LOGIN</span><u></u>
          
            <svg  version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 415.582 415.582" xml:space="preserve">
                                  <path d="M411.47,96.426l-46.319-46.32c-5.482-5.482-14.371-5.482-19.853,0L152.348,243.058l-82.066-82.064
                                        c-5.48-5.482-14.37-5.482-19.851,0l-46.319,46.32c-5.482,5.481-5.482,14.37,0,19.852l138.311,138.31
                                        c2.741,2.742,6.334,4.112,9.926,4.112c3.593,0,7.186-1.37,9.926-4.112L411.47,116.277c2.633-2.632,4.111-6.203,4.111-9.925
                                        C415.582,102.628,414.103,99.059,411.47,96.426z"/>
                                  </svg>
          </button>
          <div class="f_link">
            <a href="" class="resetTag">Forgot your password?</a>
          </div>
        </form>
      </div>
      <div class="box forgetbox">
        <a  href="#" class="back icon-back">
        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 199.404 199.404" style="enable-background:new 0 0 199.404 199.404;"
     xml:space="preserve">
    <polygon points="199.404,81.529 74.742,81.529 127.987,28.285 99.701,0 0,99.702 99.701,199.404 127.987,171.119 74.742,117.876 
      199.404,117.876 "/>
  </svg>
        </a>
        <h2>Reset Password</h2>
        <form class="form">
          <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, </p>
          <div class="f_row last">
            <label>Email Id</label>
            <input type="text" class="input-field" required>
            <u></u>
          </div>
          <button class="btn"><span>Reset</span><u></u>
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 415.582 415.582" xml:space="preserve">
                                  <path d="M411.47,96.426l-46.319-46.32c-5.482-5.482-14.371-5.482-19.853,0L152.348,243.058l-82.066-82.064
                                        c-5.48-5.482-14.37-5.482-19.851,0l-46.319,46.32c-5.482,5.481-5.482,14.37,0,19.852l138.311,138.31
                                        c2.741,2.742,6.334,4.112,9.926,4.112c3.593,0,7.186-1.37,9.926-4.112L411.47,116.277c2.633-2.632,4.111-6.203,4.111-9.925
                                        C415.582,102.628,414.103,99.059,411.47,96.426z"/>
                                  </svg>
          </button>
        </form>
      </div>
      <a style="background-color:#16a085;" href="signup" class="regTag icon-add">
        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 357 357" style="enable-background:new 0 0 357 357;" xml:space="preserve">
          <path d="M357,204H204v153h-51V204H0v-51h153V0h51v153h153V204z"/>
        </svg>
  
      </a>
    </div>
 


</div>  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="/js/login.js"> </script>
</body>
</html>


