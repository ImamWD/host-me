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
  function shopInfo() //signup api function
{
    const formData = new FormData();
    formData.append('Auth', localStorage.getItem('token'));
    fetch('api/shopsinfo',
     {
        method: 'POST',
        body: formData
    })
      .then(response => response.json())
      .then(data => setinfo(data))
      .catch();    
} 
shopInfo();
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
      let image ='';
      let imageCat ='';

      if(data[key]['logourl'] != null)
      {
        image =
        `
        <div class="product-cell image">
        <img src="http://localhost:8000${data[key]['logourl']}" alt="product">
        </div>
        `
      }
      else
      {
        image =
        `
        <div class="product-cell image">
        <img src="/images/crud/noimage.jpg" alt="product">
        </div>
        `
      }
      str += `
      <div onclick="openshop(${data[key]['id']})" class="products-row" style="overflow:auto;">
      `
      +image+
      `    
      <div class="product-cell sales"><span class="cell-label">Shop Name:</span><span style="overflow:auto; width:100px" >${data[key]['Name']}</span></div>  
      <div class="product-cell sales"><span class="cell-label">Subscriber:</span><span style="overflow:auto; width:100px" >${data[key]['UNAME']}</span></div>
      <div class="product-cell stock"><span class="cell-label">Location:</span><span style="overflow:auto; width:100px" >${data[key]['location']}</span></div>
      <div class="product-cell stock"><span class="cell-label">Category:</span><span style="overflow:auto; width:100px" >${data[key]['CNAME']}</span></div>
      <div class="product-cell price"><span class="cell-label">Created:</span><span style="overflow:auto; width:100px" >${data[key]['created_at']}</span></div>
      <div class="product-cell price"><span class="cell-label">Updated:</span><span style="overflow:auto; width:100px" >${data[key]['updated_at']}</span></div>
      <div  class="product-cell price"><span class="cell-label">Events:</span> <span style="width:150px; display: flex; justify-content: flex-end; " >
      <button style="margin-right:1px" class="btn btn-success"><i class="fa-solid fa-file-pen" style="color: #ffffff;"></i></button>
      <button class="btn btn-danger" ><i class="fa-solid fa-trash-can" style="color: #ffffff;"></i></button></span>
       </div>
    </div>
      `;
    }
   items.innerHTML += str; 
}
function openshop(ID)
{
  localStorage.setItem('shopId', ID);
  window.location.href='/myShop';
}
function allsubsapi()
{
    const formData = new FormData();
    formData.append('Auth', localStorage.getItem('token'));
    formData.append('type',2);
    fetch('api/Usersinfo',
     {
        method: 'POST',
        body: formData
    })
      .then(response => response.json())
      .then(data => allcategoryapi(data))
      .catch();
}
function allcategoryapi(D1)
{
    const formData = new FormData();
    formData.append('Auth', localStorage.getItem('token'));
    fetch('api/categoryinfo',
     {
        method: 'POST',
        body: formData
    })
      .then(response => response.json())
      .then(data => addShop(D1,data))
      .catch();
}
async function addShop(data,data1)
{
    let htmlval ='';
    for (const key in data)
   {
    htmlval+=`<option value="${data[key]['ssn']}"> ${data[key]['Name']}</option>`;
   }
   let htmlval1 ='';
   for (const key in data1)
  {
   htmlval1+=`<option value="${data1[key]['id']}">${data1[key]['name']}</option>`;
  }


     await Swal.fire({
        title: 'Add New Employee',
        showCancelButton: false, 
        showConfirmButton: false ,
        html:  `
        <label style = "display:flex">
         <div style="width:100%">
        <input placeholder="Shop Name" onkeyup="addValidation(this,1)"  type="text" id="shopname" class="form-control  swal2-input " style="width:80%"/>
        </div>   
        </label>
            
          <label style = "display:flex">
          <div style="width:100%">     
          <input placeholder="Location" onkeyup="addValidation(this,2)" type="text" id="location" class="form-control swal2-input" style="width:80%"/>
          </div> 
          </label>
         

       

       <label style = "display:flex">
       <div style="width:100%">     
       <input placeholder="Personal image(otional)" type="file" id="image" class="form-control swal2-input" style="width:80%"/>
       </div> 
       </label>

       <label style = "display:flex">
       <div style="width:100%">    
       Subscriber :
       <select id="select">
     
       `
       +htmlval+
       `
      
       </select> 
       </div> 
       </label> 

       <label style = "display:flex">
       <div style="width:100%">    
       Category :
       <select id="select1">
     
       `
       +htmlval1+
       `
      
       </select> 
       </div> 
       </label> 
      
       <button onclick="addApi()" id="js-btn" class="btn btn-danger disabled" style="width: 100px; margin-right: auto;  margin-left: auto; margin-top:40px;"/>
       Add new
       </button>
                
                `,
        focusConfirm: true,
        
    })
}
let validArray=[];
validArray[0] = 0;//name
validArray[1] = 0;//Location
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
      case 2: //Location
      {
        if(OBJ.value.length >2 && OBJ.value.charAt(0)>='A' && OBJ.value.charAt(0)<='Z')
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
  }
  activebtn();
}
function activebtn()
{
  let addbtn = document.getElementById('js-btn');
  if(validArray[0] && validArray[1])
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
let name = document.getElementById('shopname').value;
let location = document.getElementById('location').value;
let select = document.getElementById('select').value;
let select1 = document.getElementById('select1').value;

let image = document.getElementById('image');

   const formData = new FormData();
    formData.append('name', name);
    formData.append('location', location);
    formData.append('sub_id', select);
    formData.append('cat_id', select1);
    formData.append('Auth', localStorage.getItem('token'));

    if(image.files[0])
    {
      formData.append('image', image.files[0]);
    }
    fetch('api/addShop',
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
    shopInfo();
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