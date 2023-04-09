
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
    formData.append('image', image.files[0]);

    fetch('api/customerSignup',
     {
        method: 'POST',
        body: formData
    })
      .then(response => response.json())
      .then(data => console.log(data))
      .catch(error => console.error(error));    
}