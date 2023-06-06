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
    formData.append('shop_id', localStorage.getItem('shopId'));
    fetch('api/AllOrdersInfoFromOneShop',
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
      str += `
      <div class="products-row" style="overflow:auto;">
         
      <div class="product-cell sales"><span class="cell-label">Order name:</span><span style="overflow:auto; width:200px" >${data[key]['ONAME']}</span></div>  
      <div class="product-cell sales"><span class="cell-label">Order customer:</span><span style="overflow:auto; width:100px" >${data[key]['CustomerName']}</span></div>  
      <div class="product-cell sales"><span class="cell-label">Products count:</span><span style="overflow:auto; width:100px" >${data[key]['ProductsCount']}</span></div>  
      
      <div  class="product-cell price"><span class="cell-label">Events:</span> <span style="width:150px; display: flex; justify-content: flex-end; " >
      <button onclick="openPRS(${data[key]['Oid']},'${data[key]['ONAME']}')" style="margin-right:1px" class="btn btn-success"><i class="fa-solid fa-sort-down" style="color: #ffffff;"></i></button>
      </span>
       </div>
    </div>
      `;
    }
   items.innerHTML += str; 
}
function openPRS(id,name)
{
    localStorage.setItem('Oid', id);
    localStorage.setItem('Oname', name);

    window.location.href='/shoporderproducts';
}
function allcategoryapi()
{
    const formData = new FormData();
    formData.append('Auth', localStorage.getItem('token'));
    fetch('api/categoryinfo',
     {
        method: 'POST',
        body: formData
    })
      .then(response => response.json())
      .then(data => addproduct(data))
      .catch();
}
async function addproduct(data)
{
    let htmlval ='';
    for (const key in data)
    {
        htmlval+=`<option value="${data[key]['id']}">${data[key]['name']}</option>`;
    }
     await Swal.fire({
        title: 'Add New Product',
        showCancelButton: false, 
        showConfirmButton: false ,
        html:  `
        <label style = "display:flex">
         <div style="width:100%">
        <input placeholder="Name"   type="text" id="name" class="form-control  swal2-input " style="width:80%"/>
        </div>   
        </label>
            
          <label style = "display:flex">
          <div style="width:100%">     
          <input placeholder="Price"  type="text" id="price" class="form-control swal2-input" style="width:80%"/>
          </div> 
          </label>

          <label style = "display:flex">
         <div style="width:100%">     
         <input placeholder="Discount"  type="text" id="discount" class="form-control swal2-input" style="width:80%"/>
         </div> 
         </label>
         
         <label style = "display:flex">
         <div style="width:100%">     
         <input placeholder="Personal image(otional)" type="file" id="image" class="form-control swal2-input" style="width:80%"/>
         </div> 
         </label>

         <label style = "display:flex">
         <div style="width:100%">    
         Category :
         <select id="select">
     
       `
       +htmlval+
       `
      
         </select> 
         </div> 
         </label> 

         
       
       <button onclick="addApi()" id="js-btn" class="btn btn-danger " style="width: 100px; margin-right: auto;  margin-left: auto; margin-top:40px;"/>
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
let price = document.getElementById('price').value;
let discount = document.getElementById('discount').value;
let image = document.getElementById('image');
let select = document.getElementById('select').value;
let description ="Adscvdrf";

   const formData = new FormData();
   formData.append('Auth', localStorage.getItem('token'));
   formData.append('name', name);
    formData.append('price', price);
    formData.append('discount', discount);
    formData.append('description', description);
    formData.append('Sid',localStorage.getItem('shopId') );
    formData.append('catid', select);

    if(image.files[0])
    {
      formData.append('image', image.files[0]);
    }
    fetch('api/addproduct',
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
    title: 'Do you want to delete this Product ?',
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
    formData.append('id', id);
    fetch('api/DeleteProduct',
     {
        method: 'POST',
        body: formData
    })
      .then(response => response.json())
      .then()
      .catch();
     

}
