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
    fetch('api/categoryinfo',
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
      let image ='';
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
        <img src="/images/crud/noimage.jpg" alt="product">
      </div>
        `
      }
      str += 
      `
      <div class="products-row" style="overflow:auto;">
      `
      +image+
      `    
      <div class="product-cell sales"><span class="cell-label">Name:</span><span style="overflow:auto; width:100px" >${data[key]['name']}</span></div>  
     
      <div  class="product-cell price"><span class="cell-label">Events:</span> <span style="width:150px; display: flex; justify-content: flex-end; flex-direction: row-reverse;" >
      <button style="margin-right:1px ; " class="btn btn-success"><i class="fa-solid fa-file-pen" style="color: #ffffff;"></i></button>
      <button onclick='suredelete("${data[key]['id']}")' class="btn btn-danger" ><i class="fa-solid fa-trash-can" style="color: #ffffff;"></i></button></span>
       </div>
    </div>
      `;
    }
   items.innerHTML += str; 
}

async function addcategory()
{
     await Swal.fire({
        title: 'Add New Category',
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
       <input placeholder="Personal image(otional)" type="file" id="image" class="form-control swal2-input" style="width:80%"/>
       </div> 
       </label>
 
       <button onclick="addApi()" id="js-btn" class="btn btn-danger disabled" style="width: 100px; margin-right: auto;  margin-left: auto; margin-top:40px;"/>
       Add new
       </button>
                
                `,
        focusConfirm: true,
        
    })
}


validArray = 0;//name


function addValidation(OBJ,flag)
{

     
        if(OBJ.value.length >2 && OBJ.value.charAt(0)>='A' && OBJ.value.charAt(0)<='Z')
        {
          OBJ.classList.add('is-valid');
          OBJ.classList.remove('is-invalid');
          validArray =1;
        }
        else
        {
          OBJ.classList.remove('is-valid');
          OBJ.classList.add('is-invalid');
          validArray =0;
        }
       
  activebtn();
}
function activebtn()
{
  let addbtn = document.getElementById('js-btn');
  if(validArray)
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
let image = document.getElementById('image');


   const formData = new FormData();
    formData.append('name', name);
    formData.append('Auth', localStorage.getItem('token'));

    if(image.files[0])
    {
      formData.append('image', image.files[0]);
    }
    fetch('api/addcategory',
     {
        method: 'POST',
        body: formData
    })
      .then(data => apiError((data)))
      .catch();
}

function apiError(ERR)
{
  if(JSON.stringify(ERR.Error))
  {
    ERRmsg = JSON.stringify( ERR.Error);
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
      text:'Success',
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