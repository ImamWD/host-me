
function signupUser() //signup api function
{
    const name = document.getElementById('name').value;//name dom
    const email = document.getElementById('email').value;//email dom
    const password = document.getElementById('password').value;//password dom
    const config_pass = document.getElementById('config_pass').value;//config dom
    const location = document.getElementById('location').value;//location dom
    const phone = document.getElementById('phone').value;//phone dom
    const image = document.getElementById('image');//image dom

    const formData = new FormData();
    formData.append('name', name);
    formData.append('email', email);
    formData.append('password', password);
    formData.append('config_password', config_pass);
    formData.append('location', location);
    formData.append('phone', phone);
    if(image.files[0])
    {
      formData.append('image', image.files[0]);
    }
    fetch('api/customerSignup',
     {
        method: 'POST',
        body: formData
    })
      .then(response => response.json())
      .then(data => apiError((data)))
      .catch();    
} 

// flags
let name_falg =0;
let email_flag =0;
let password_flag =0;
let config_password_falg =0;
let location_flag =1;
let phone_flag =1;
let image_flag =1;
//error mgs
let name_msg = document.getElementById('name_msg');
let email_msg =document.getElementById('email_msg');
let password_msg =document.getElementById('password_msg');
let config_password_msg =document.getElementById('config_msg');
let location_msg =document.getElementById('location_msg');
let phone_msg =document.getElementById('phone_msg');
let image_msg =document.getElementById('image_msg');
let passwordfeld = document.getElementById('password');

function validation(OBJECT ,flag)
{
  switch(flag)
  {
    case 0: // name validation
      {
        
        if (/^[A-Z][a-zA-Z ]{1,20}$/.test(OBJECT.value))
        {
          OBJECT.classList.add('is-valid');
          OBJECT.classList.remove('is-invalid');
          name_falg = 1;
          name_msg.innerHTML ="";
        }
        else
        {
          OBJECT.classList.add('is-invalid');
          OBJECT.classList.remove('is-valid');
          name_falg = 0;
          name_msg.innerHTML ="invalid name format ";
        }
        break;
      }
    case 1: // email validation
      {
        if (/\S+@\S+\.\S+/.test(OBJECT.value)) {
          OBJECT.classList.add('is-valid');
          OBJECT.classList.remove('is-invalid');
          email_flag = 1;
          email_msg.innerHTML="";
        }
        else
        {
          OBJECT.classList.add('is-invalid');
          OBJECT.classList.remove('is-valid');
          email_flag = 0;
          email_msg.innerHTML ="Invalid email  ";
        }
        break;
      }
    case 2: // password validation
      {
        if (/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,50}$/.test(OBJECT.value))
         {
          OBJECT.classList.add('is-valid');
          OBJECT.classList.remove('is-invalid');
          password_flag = 1;
          password_msg.innerHTML="";
        }
        else
        {
          OBJECT.classList.add('is-invalid');
          OBJECT.classList.remove('is-valid');
          password_flag = 0;
          password_msg.innerHTML ="Invalid password ";
        }
        break;
      } 
    case 3: // configration password validation
      {
        if(OBJECT.value == passwordfeld.value)
        {
          OBJECT.classList.add('is-valid');
          OBJECT.classList.remove('is-invalid');
          config_password_falg = 1;
          config_password_msg.innerHTML="";
        }
        else
        {
          OBJECT.classList.add('is-invalid');
          OBJECT.classList.remove('is-valid');
          config_password_falg = 0;
          config_password_msg.innerHTML="Password not configration";
        }
        break;
      } 
    case 4: // location validation
      {
        if(OBJECT.value !=='')
        {
          OBJECT.classList.add('is-valid');
          OBJECT.classList.remove('is-invalid');
          location_flag = 1;
          location_msg.innerHTML="";
        }
        else
        {
          OBJECT.classList.add('is-invalid');
          OBJECT.classList.remove('is-valid');
          location_flag = 0;
          location_msg.innerHTML="Location is empty";
        }
        break;
      }
    case 5: // phone validation
      {
        if (/^[0-9]{10}$/.test(OBJECT.value))
         {
          OBJECT.classList.add('is-valid');
          OBJECT.classList.remove('is-invalid');
          phone_flag = 1;
          phone_msg.innerHTML="";
        }
        else
        {
          OBJECT.classList.add('is-invalid');
          OBJECT.classList.remove('is-valid');
          phone_flag = 0;
          phone_msg.innerHTML="Invalid phone number";
        }
        break;
      }
    case 6: // image validation
      {
        if (/\S+jpg|jpeg|png|gif/.test(OBJECT.files[0].type))
         {
          image_flag = 1;
          image_msg.innerHTML="";
        }
        else
        {
          image_flag = 0;
          image_msg.innerHTML="Must be upload just an image";
        }
        break;
      }
    default:
      {
        break;
      }
  }
  active_btn()
}
function active_btn()
{
  signupbtn = document.getElementById('submit-btn');
  if(name_falg && email_flag && password_flag && config_password_falg && image_flag)
  {
    signupbtn.classList.remove('disabled');
    signupbtn.style="background-color:#16a085";
  }
  else
  {
    signupbtn.classList.add('disabled');
    signupbtn.style="background-color:red ; color:white";
  }
}

function apiError(ERR)
{
  if(JSON.stringify(ERR.errors))
  {
    ERRmsg = JSON.stringify( ERR.errors);
    const unwantedCharacters = /[/{/}/"]/gi;
    const unwantedCharacters1 = /[,]/gi;
    const newString = ERRmsg.replace(unwantedCharacters, '');
    const newString1 = newString.replace(unwantedCharacters1, `<br></br>`);
  Swal.fire({
    icon: 'error',
    title: 'Oops...',
    html: newString1,
    footer: '<a href="">Why do I have this issue?</a>'
  })
  }
  else
  {
    Swal.fire({
      icon: 'success',
      title: 'SUCCESS',
      text:'Signup is success',
      footer: '<a href="">Why do I have this issue?</a>'
    })
    window.location.href = '/';
  }

}