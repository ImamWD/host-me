let email_label = document.getElementById('email-label');
let password_label = document.getElementById('password-label');
let Errors = document.getElementById('Error');
var inP     =   $('.input-field');
inP.on('blur', function () {
    if (!this.value) {
        $(this).parent('.f_row').removeClass('focus');
    } else {
        $(this).parent('.f_row').addClass('focus');
    }
}).on('focus', function () {
    $(this).parent('.f_row').addClass('focus');
    $('.btn').removeClass('active');
    $('.f_row').removeClass('shake');
   
});


$('.resetTag').click(function(e){
    e.preventDefault();
    $('.formBox').addClass('level-forget').removeClass('level-reg');
});

$('.back').click(function(e){
    e.preventDefault();
    $('.formBox').removeClass('level-forget').addClass('level-login');
});

$('.btn').each(function() {
     $(this).on('click', function(e){
        e.preventDefault();
        
        var finp =  $(this).parent('form').find('input');
       
     //  console.log(finp.html());
       
        if (!finp.val() == 0) {
            $(this).addClass('active');
        }
        
      
         
        if(inP.val() == 0) {
            inP.parent('.f_row').addClass('shake');
        }
         
        //inP.val('');
        //$('.f_row').removeClass('focus');
        
    });
});
//___________________API_______________________
//login api
let loginbtn = document.querySelector('#login-btn');
loginbtn.addEventListener('click',loginUser);//DOM for submit button

function loginUser() //login api function
{
    const email = document.getElementById('email').value;//email dom
    const password = document.getElementById('password').value;//password dom
    const xhr = new XMLHttpRequest();// create new http ptcle request
    xhr.open('POST', 'api/login'); //include login api
    xhr.setRequestHeader('Content-Type', 'application/json');//select api type(json)
    xhr.onload = function() { // this function calling if page is apload
        if (xhr.status === 200) { // request is succesfully(200)OK
            const response = JSON.parse(xhr.responseText);//convert json to array format
            localStorage.setItem('token', response.token);//store token in localStorage
            localStorage.setItem('user_id', response.user_id);//store token in localStorage
            localStorage.setItem('user_type', response.user_type);//store token in localStorage

            window.location.href = '/';//open home page after login succesfully
        }
         else  //error for login input 400 incorrect email or pass , 401 formating error
         {
            const response = JSON.parse(xhr.responseText);//convert json to array format
            Errors.innerHTML = response.error;
         }  
        
    };
    xhr.onerror = function() {
        alert('An error occurred.');
    };
    xhr.send(JSON.stringify({ email: email, password: password }));    
}



let email =0;
let password =0;

function validation(OBJ,flag)
{
  
    if(flag == 0)
    {
        if(OBJ.value.length > 9 && OBJ.value.length < 255 && OBJ.value.includes('@') && OBJ.value.includes('.'))
        {
            email_label.style.color="green";
            email =1;
        }
        else 
        {
            email_label.style.color="red";
            email =0;
        }
    }
    else
    {
        if(OBJ.value.length >= 1)
        {
            password_label.style.color="green";
            password =1;
        }
        else
        {
            password_label.style.color="red";
            password =0;
        }

    }
    checkbtn();
    
}
function checkbtn()
{
    if(email == 1 && password == 1)
    {
        loginbtn.classList.remove('disabled');
        loginbtn.style.color="green";
    }
    else
    {
        loginbtn.classList.add('disabled');
        loginbtn.style.color="red";
    }
}