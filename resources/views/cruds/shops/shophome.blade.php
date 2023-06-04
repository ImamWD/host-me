<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Shop Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/myshop.css">
</head>
<body>
    <div class="dashboard-river">

        <div class="dashboard-container">
      
          <div class="dashboard">
      
            <div class="ui-row-1">
      
              <div class="logo-comp">
                <div  class="profile">
                  <div id="shopImage">
                  </div>
                </div>
                <p id="shopname">Shop Dashboard</p>
              </div>
      
              <div class="search">
                <input type="search" id="search" name="search" placeholder="Search...">
                <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                </svg>
              </div>
      
              <div  class="profile">
                
                <div class="logo-comp">
                <p style="margin-top:15px; margin-right:100px" id="UNAME"></p>
                </div>
                <div id="profile">
                
                </div>
              </div>
      
              <div class="profile-small">
               
              </div>
      
            </div>
      
            <div class="ui-row-2">
      
              <div class="left-sidebar">
      
                <div title="home">
                  <i class="fa-solid fa-house" style="color: #000000;"></i>
                </div>
                <div title="market" >
                  <i class="fa-solid fa-store" style="color: #000000;"></i>
                </div>
      
                <div title="employee">
                  <i class="fa-solid fa-person-walking-arrow-right" style="color: #000000;"></i>

                </div>
      
                <div title="products">
                  <i class="fa-solid fa-wheat-awn-circle-exclamation" style="color: #000000;"></i> 
                </div>
      
                <div title="ads" >
                  <i class="fa-solid fa-headset" style="color: #000000;"></i>
                </div>
      
                <div title="orders">
                  <i class="fa-solid fa-cart-shopping" style="color: #000000;"></i>
                </div>
      
              </div>
      
              <div class="main-content">
      
                <div class="header">
      
                  <div class="page-display">
                    <h1>Market</h1>
                    
                  </div>
      
                  <div class="clay-category">
                    
                    <p><i style="margin-top:3px " class="fa-solid fa-pen-nib" style="color: #ffffff;"></i>
                    </p>
                    <p>Update Shop</p>
                  </div>
      
                  <div class="clay-category bg-info">
                  
                    <p><i style="margin-top:3px " class="fa-solid fa-bell-slash" style="color: #ffffff;"></i>
                    </p>
                    <p>Disactive Shop</p>
                  </div>
      
                  <div class="clay-category bg-danger">
                    
                  
                        <p><i style="margin-top:3px " class="fa-solid fa-delete-left" style="color: #ffffff;"></i>
                        </p>
                        <p>Delete Shop</p>
                  </div>
      
                </div>
                
                <div  class="large-banner">
      
                    <h2 id="ShopName"></h2>
                    <a href="javascript:void(0);" title="Explore">
                     Show Logo
                    </a>
        
                  </div>
              
                <hr>
      
                <div class="featured-clay">
      
                  <div>
      
                    <div id="CatImage"></div>
      
                    <div>
                      <h3>Category</h3>
                      <p id="catName"></p>
                      <a href="javascript:void(0);" title="featured clay">Let's Go</a>
                    </div>
      
                  </div>
      
                  <div>
      
                    <div id="productimage"></div>
      
                    <div>
                      <h3>Products</h3>
                      <p>Dashboard</p>
                      <a href="javascript:void(0);" title="featured clay">Let's Go</a>
                    </div>
      
                  </div>
      
                  <div>
      
                    <div id="Employees"></div>
      
                    <div>
                      <h3>Employees</h3>
                      <p>Dashboard</p>
                      <a href="javascript:void(0);" title="featured clay">Let's Go</a>
                    </div>
      
                  </div>
      
                  <div>
      
                    <div id="ads"></div>
      
                    <div>
                      <h3>Advertisements</h3>
                      <p>Dashboard</p>
                      <a href="javascript:void(0);" title="featured clay">Let's Go</a>
                    </div>
      
                  </div>
      
                  <div>
      
                    <div id="orders"></div>
      
                    <div>
                      <h3>Orders</h3>
                      <p>Dashboard</p>
                      <a href="javascript:void(0);" title="featured clay">Let's Go</a>
                    </div>
      
                  </div>
      

      
                </div>
      
                <hr>
      
            
                
            </div>
      
          </div>
      
        </div>
      
      </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="/js/all.min.js"> </script>

    <script src="/js/cruds/myshop.js"> </script>
</body>
</html>