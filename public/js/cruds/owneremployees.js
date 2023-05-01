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

// load users information api
  function userInfo() //signup api function
{
    const formData = new FormData();
    formData.append('Auth', localStorage.getItem('token'));
    formData.append('type', 1);

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
  let str = '';
  for (const key in data)
   {
      let state = '';
      let image ='';
      console.log(data[key]['Name']);
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
      <div class="product-cell price"><span class="cell-label">Salary:</span><span style="overflow:auto; width:100px" >${data[key]['salary']}</span></div>
      <div class="product-cell price"><span class="cell-label">Web access:</span>$560</div>
      <div class="product-cell price"><span class="cell-label">Shop access:</span>$560</div>
      <div  class="product-cell price"><span class="cell-label">Events:</span> <span style="width:150px; display: flex;" >
      <button style="margin-right:1px" class="btn btn-success"><i class="fa-solid fa-file-pen" style="color: #ffffff;"></i></button>
      <button class="btn btn-danger" ><i class="fa-solid fa-trash-can" style="color: #ffffff;"></i></button></span>
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
        <input placeholder="Name" onkeyup="addValidation(this)"  type="text" id="swal-input1" class="form-control  swal2-input " style="width:80%"/>
        </div>   
        </label>
            
          <label style = "display:flex">
          <div style="width:100%">     
          <input placeholder="Email" onkeyup="addValidation(this)" type="text" id="swal-input2" class="form-control swal2-input" style="width:80%"/>
          </div> 
          </label>

          <label style = "display:flex">
         <div style="width:100%">     
         <input placeholder="Password" onkeyup="addValidation(this)" type="text" id="swal-input3" class="form-control swal2-input" style="width:80%"/>
         </div> 
         </label>

         <label style = "display:flex">
        <div style="width:100%">     
        <input placeholder="Configration" onkeyup="addValidation(this)" type="text" id="swal-input4" class="form-control swal2-input" style="width:80%"/>
        </div> 
        </label>

        <label style = "display:flex">
       <div style="width:100%">     
       <input placeholder="Location(optional)" onkeyup="addValidation(this)" type="text" id="swal-input5" class="form-control swal2-input" style="width:80%"/>
       </div> 
       </label>

       <label style = "display:flex">
       <div style="width:100%">     
       <input placeholder="Phone(optional)" onkeyup="addValidation(this)" type="text" id="swal-input6" class="form-control swal2-input" style="width:80%"/>
       </div> 
       </label>

       <label style = "display:flex">
       <div style="width:100%">     
       <input placeholder="Personal image(otional)" onkeyup="addValidation(this)" type="file" id="swal-input7" class="form-control swal2-input" style="width:80%"/>
       </div> 
       </label>

       <button onclick="api()" id="js-btn" class="btn btn-primary disabled" style="width: 100px; margin-right: auto;  margin-left: auto; margin-top:40px;"/>
       Add new
       </button>
                
                `,
       
        focusConfirm: true,
        
    })
}

function api()
{

}
