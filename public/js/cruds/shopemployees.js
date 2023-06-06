//___________________________ HTML________________________

document.querySelector(".jsFilter").addEventListener("click", function () {
    document.querySelector(".filter-menu").classList.toggle("active");
  });
  
  document.querySelector(".grid").addEventListener("click", function () {
    document.querySelector(".list").classList.remove("active");
    document.querySelector(".grid").classList.add("active");
    document.querySelector(".products-area-wrapper").classList.add("gridView");
    document
      .querySelector(".products-area-wrapper")
      .classList.remove("tableView");
  });
  
  document.querySelector(".list").addEventListener("click", function () {
    document.querySelector(".list").classList.add("active");
    document.querySelector(".grid").classList.remove("active");
    document.querySelector(".products-area-wrapper").classList.remove("gridView");
    document.querySelector(".products-area-wrapper").classList.add("tableView");
  });
  
  var modeSwitch = document.querySelector('.mode-switch');
  modeSwitch.addEventListener('click', function ()
   {                      
    document.documentElement.classList.toggle('light');
   modeSwitch.classList.toggle('active');
  });
//___________________________________ ADD NEW && show data for O-Employee Functions________________________
// load users information api
  function userInfo() //signup api function
{
    const formData = new FormData();
    formData.append('Auth', localStorage.getItem('token'));
    formData.append('type', 3);

    fetch('api/Usersinfo',
     {
        method: 'POST',
        body: formData
    })
      .then(response => response.json())
      .then(data => setinfo(data))
      .catch();    
} 
userInfo();
function setinfo(data)
{
  if(JSON.stringify(data.Error))
  {
    ERRmsg = JSON.stringify( data.Error);
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
  setTimeout(function() {
    window.location.href = '/';  }, 1000);
  }

  else
  {
    showdata(data);
  }
}
let items = document.getElementById('items');
function showdata(data)
{
  items.innerHTML ='';
  let str = '';
  for (const key in data)
   {
      let state = '';
      let image ='';
      if(data[key]['active'])
      {
        
       state= `<div class="product-cell status-cell" style=" width:100px">
        <span class="cell-label">Status:</span>
        <span class="status active">Active</span>
       </div>`;
      }
      else
      {
        state = `<div class="product-cell status-cell" style=" width:100px">
        <span class="cell-label">Status:</span>
        <span class="status disabled">Disabled</span>
      </div>`;
      }

      if(data[key]['imageurl'] != null)
      {
        image =
        `
        <div class="product-cell image">
        <img src="http://localhost:8000${data[key]['imageurl']}" alt="product">
      </div>

        `
      }
      else
      {
        image =
        `
        <div class="product-cell image">
        <img src="/images/crud/man-157699__340.jpg" alt="product">
      </div>

        `
      }

      str += `
      <div class="products-row" style="overflow:auto;">
      `
      +image+state+
      `    
      <div class="product-cell sales"><span class="cell-label">Name:</span><span style="overflow:auto; width:100px" >${data[key]['Name']}</span></div>  
      <div class="product-cell sales"><span class="cell-label">Email:</span><span style="overflow:auto; width:100px" >${data[key]['Email']}</span></div>
      <div class="product-cell stock"><span class="cell-label">Password:</span><span style="overflow:auto; width:100px" >${data[key]['passW']}</span></div>
      <div class="product-cell price"><span class="cell-label">Phone:</span><span style="overflow:auto; width:100px" >${data[key]['Phone']}</span></div>
      <div class="product-cell price"><span class="cell-label">Location:</span><span style="overflow:auto; width:100px" >${data[key]['location']}</span></div>
      <div class="product-cell price"><span class="cell-label">Web access:</span>
      <button style="margin-right:1px" class="btn btn-info"><i class="fa-solid fa-eye" style="color: #ffffff;"></i></button>

      </div>
      <div  class="product-cell price"><span class="cell-label">Events:</span> <span style="width:150px; display: flex; justify-content: flex-end; " >
      <button style="margin-right:1px" class="btn btn-success"><i class="fa-solid fa-file-pen" style="color: #ffffff;"></i></button>
      <button onclick='suredelete("${data[key]['ssn']}")' class="btn btn-danger" ><i class="fa-solid fa-trash-can" style="color: #ffffff;"></i></button></span>
       </div>
    </div>
      `;
    }
   items.innerHTML += str; 
}

async function addemployee()
{
     await Swal.fire({
        title: 'Add New Employee',
        showCancelButton: false, 
        showConfirmButton: false ,
        html:  `
        <label style = "display:flex">
         <div style="width:100%">
        <input placeholder="Name" onkeyup="addValidation(this,1)"  type="text" id="name" class="form-control  swal2-input " style="width:80%"/>
        </div>   
        </label>
            
          <label style = "display:flex">
          <div style="width:100%">     
          <input placeholder="Email" onkeyup="addValidation(this,2)" type="text" id="email" class="form-control swal2-input" style="width:80%"/>
          </div> 
          </label>

          <label style = "display:flex">
         <div style="width:100%">     
         <input placeholder="Password" onkeyup="addValidation(this,3)" type="password" id="password" class="form-control swal2-input" style="width:80%"/>
         </div> 
         </label>

         <label style = "display:flex">
        <div style="width:100%">     
        <input placeholder="Configration" onkeyup="addValidation(this,4)" type="password" id="config" class="form-control swal2-input" style="width:80%"/>
        </div> 
        </label>

        <label style = "display:flex">
       <div style="width:100%">     
       <input placeholder="Location(optional)" type="text" id="location" class="form-control swal2-input" style="width:80%"/>
       </div> 
       </label>

       <label style = "display:flex">
       <div style="width:100%">     
       <input placeholder="Phone(optional)" type="text" id="phone" class="form-control swal2-input" style="width:80%"/>
       </div> 
       </label>

       <label style = "display:flex">
       <div style="width:100%">     
       <input placeholder="Salary" type="number" id="salary" class="form-control swal2-input" style="width:80%"/>
       </div> 
       </label>

       <label style = "display:flex">
       <div style="width:100%">     
       <input placeholder="Personal image(otional)" type="file" id="image" class="form-control swal2-input" style="width:80%"/>
       </div> 
       </label>

        
       <p style="padding-left: 12%; text-align:left" >Access Admin pages: </p>
       <div>

       <div style="text-align: left; padding-left:12% ">
       <input type="checkbox" id="checkshops"  value="1">
       <label for="checkshops">shops</label>
       </div>

       <div style="text-align: left; padding-left:12% ">
       <input type="checkbox" id="checkcategorys" value="2">
       <label for="checkcategorys">categorys</label>
       </div>

       <div style="text-align: left; padding-left:12% ">
       <input type="checkbox" id="checkadvs" value="3">
       <label for="checkadvs">advertisements </label>
       </div>
       </div>
       </label>
       
       <p style="padding-left: 12%; text-align:left; margin-top:30px; " >Access Users pages: </p>
       <div style="display:flex; flex-direction: column; ">

       <div style="text-align: left; padding-left:12%">
       <input type="checkbox" id="checkowners" value="4">
       <label for="checkowners">Owners</label> 
       </div>

      <div style="text-align: left; padding-left:12%">
      <input type="checkbox" id="checkoemployees" value="5">
      <label for="checkoemployees">O-Employeees</label>
      </div>

      <div style="text-align: left; padding-left:12% ">
      <input type="checkbox" id="checksubscribers" value="6">
      <label for="checksubscribers">Subscribers </label>
      </div>
      <div style="text-align: left; padding-left:12% ">
      <input type="checkbox" id="checksemployees" value="7">
      <label for="checksemployees">S-Employees </label>
      </div>
      <div style="text-align: left; padding-left:12% ">
      <input type="checkbox" id="checkcustomers" value="8">
      <label for="checkcustomers">Customers </label>
      </div>
       </div>
       
       <button onclick="addApi()" id="js-btn" class="btn btn-danger disabled" style="width: 100px; margin-right: auto;  margin-left: auto; margin-top:40px;"/>
       Add new
       </button>
                
                `,
        focusConfirm: true,
        
    })
}

let validArray=[];
validArray[0] = 0;//name
validArray[1] = 0;//email
validArray[2] = 0;//password
validArray[3] = 0;//configration

function addValidation(OBJ,flag)
{

  
  switch (flag)
  {
      case 1: //Name
      {
        if(OBJ.value.length >2 && OBJ.value.charAt(0)>='A' && OBJ.value.charAt(0)<='Z')
        {
          OBJ.classList.add('is-valid');
          OBJ.classList.remove('is-invalid');
          validArray[0] =1;
        }
        else
        {
          OBJ.classList.remove('is-valid');
          OBJ.classList.add('is-invalid');
          validArray[0] =0;
        }
        break;
      }
      case 2: //Email
      {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if(emailRegex.test(OBJ.value))
        {
          OBJ.classList.add('is-valid');
          OBJ.classList.remove('is-invalid');
          validArray[1] =1;
        }
        else
        {
          OBJ.classList.remove('is-valid');
          OBJ.classList.add('is-invalid');
          validArray[1] =0;
        }

        break;
      }
      case 3: //password
      {
        const passregex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/;
        if(passregex.test(OBJ.value))
        {
          OBJ.classList.add('is-valid');
          OBJ.classList.remove('is-invalid');
          validArray[2] =1;
        }
        else
        {
          OBJ.classList.remove('is-valid');
          OBJ.classList.add('is-invalid');
          validArray[2] =0;
        }
        break;
      }
      case 4: //configration password
      {
        let passdom = document.getElementById('password');
        if(OBJ.value === passdom.value)
        {
          OBJ.classList.add('is-valid');
          OBJ.classList.remove('is-invalid');
          validArray[3] =1;
        }
        else
        {
          OBJ.classList.remove('is-valid');
          OBJ.classList.add('is-invalid');
          validArray[3] =0;
        }
        break;
      }
  }
  activebtn();
}
function activebtn()
{
  let addbtn = document.getElementById('js-btn');
  if(validArray[0] && validArray[1] && validArray[2] && validArray[3])
  {
    addbtn.classList.remove('disabled');
    addbtn.classList.remove('btn-danger');
    addbtn.classList.add('btn-success');

  }
  else
  {
    addbtn.classList.add('disabled');
    addbtn.classList.add('btn-danger');
    addbtn.classList.remove('btn-success');
  }
}


function addApi()
{
// dom vars:
let name = document.getElementById('name').value;
let email = document.getElementById('email').value;
let password = document.getElementById('password').value;
let configration = document.getElementById('config').value;
let location = document.getElementById('location').value;
let phone = document.getElementById('phone').value;
let salary = document.getElementById('salary').value;
let image = document.getElementById('image');
let checkshops = document.getElementById('checkshops');
let checkcategorys = document.getElementById('checkcategorys');
let checkadvs = document.getElementById('checkadvs');
let checkowners = document.getElementById('checkowners');
let checkoemployees = document.getElementById('checkoemployees');
let checksubscribers = document.getElementById('checksubscribers');
let checksemployees = document.getElementById('checksemployees');
let checkcustomers = document.getElementById('checkcustomers');

let access_o ='';
if(checkshops.checked)
{
  access_o += "shop,";
}
if(checkcategorys.checked)
{
  access_o += "category,";
}
if(checkadvs.checked)
{
  access_o += "adv,";
}
let access_s ='';
if(checkowners.checked)
{
  access_s += "owner,";
}
if(checkoemployees.checked)
{
  access_s += "oemployee,";
}
if(checksubscribers.checked)
{
  access_s += "subscriber,";
}
if(checksemployees.checked)
{
  access_s += "semployee,";
}
if(checkcustomers.checked)
{
  access_s += "customer,";
}

   const formData = new FormData();
    formData.append('name', name);
    formData.append('email', email);
    formData.append('password', password);
    formData.append('config_password', configration);
    formData.append('location', location);
    formData.append('phone', phone);
    formData.append('salary',salary);
    formData.append('access_o',access_o);
    formData.append('access_s', access_s);
    formData.append('type','1');
    if(image.files[0])
    {
      formData.append('image', image.files[0]);
    }
    fetch('api/adduser',
     {
        method: 'POST',
        body: formData
    })
      .then(response => response.json())
      .then(data => apiError((data)))
      .catch();
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
    })
    userInfo();
  }


}
//___________________________________ Delete O-employee Functions________________________
function suredelete(id)
{
  Swal.fire({
    title: 'Do you want to delete this user ?',
    showDenyButton: true,
    showCancelButton: true,
    confirmButtonText: 'Delete',
    denyButtonText: `Don't save`,
  }).then((result) => {
    /* Read more about isConfirmed, isDenied below */
    if (result.isConfirmed) 
    {
      deleteApi(id);
      Swal.fire('Deleted!', '', 'success');
      userInfo();

    } else if (result.isDenied) {
      Swal.fire('Changes are not saved', '', 'info')
    }
  })
}
function deleteApi(id)
{
  const formData = new FormData();
   
    formData.append('Auth',localStorage.getItem('token'));
    formData.append('ssn', id);
    fetch('api/deleteuser',
     {
        method: 'POST',
        body: formData
    })
      .then(response => response.json())
      .then()
      .catch();
     

}