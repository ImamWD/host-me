<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/all.min.css">
    <link rel="stylesheet" href="/css/cruds/homecrud.css">
    <title>Document</title>
</head>
<body>
    
    <div class="app">
        
        <div class="app-body">
            <div class="app-body-navigation">
                <nav class="navigation">
                    <a href="#">
                        <img src="/images/hostmelogo.jpg" />
                    </a>
                    <a href="#">
                        <i style="margin-right:5px" class="fa-solid fa-house" style="color: #969593;"></i>
                        <span>Home</span>
                    </a>
                    <a href="#">
                        <i style="margin-right:5px" class="fa-solid fa-user" style="color: #969593;"></i>
                        <span>Users</span>
                    </a>
                    <a href="#">
                        <i style="margin-right:5px;" class="fa-solid fa-shop"  style="color: #969593;" ></i>
                        <span>Shop</span>
                    </a>
                    <a href="#">
                        <i style="margin-right:5px;" class="fa-solid fa-heart" style="color: #969593;"></i>
                        <span>Category</span>
                    </a>
                    <a href="#">
                        <i style="margin-right:5px;" class="fa-solid fa-rectangle-ad"  style="color: #969593;" ></i>
                        <span>Advertisements</span>
                    </a>
                    <a href="#">
                        <i style="margin-right:5px;" class="fa-solid fa-arrow-right-from-bracket"  style="color: #969593;" ></i>
                        <span>Logout</span>
                    </a>
                </nav>
               
            </div>
            <div class="app-body-main-content">
                <section class="service-section">
                    <h2>Dashboard home</h2>
                    <div class="service-section-header">
                        <div class="search-field">
                            <i class="ph-magnifying-glass"></i>
                            <input type="text" placeholder="Page Name">
                        </div>
                        <div class="dropdown-field">
                            <select>
                                <option>Home</option>
                                <option>Crud</option>
                            </select>
                            <i class="ph-caret-down"></i>
                        </div>
                        <button class="flat-button">
                            Search
                        </button>
                    </div>
                    <div class="mobile-only">
                        <button class="flat-button">
                            Toggle search
                        </button>
                    </div>
                    <div class="tiles">
                        <article class="tile">
                            <div class="tile-header">
                                <i class="ph-lightning-light"></i>
                                <h3>
                                    <span><i style="margin-right:5px" class="fa-solid fa-user" style="color: #000000;"></i> Users</span>
                                    
                                        <div style="font-size: 16px"><i style="margin-right:3px " class="fa-regular fa-circle-dot" style="color: #000000;"></i>Owner</div>
                                        <div style="font-size: 16px"><i style="margin-right:3px " class="fa-regular fa-circle-dot" style="color: #000000;"></i>O Employee</div>
                                        <div style="font-size: 16px"><i style="margin-right:3px " class="fa-regular fa-circle-dot" style="color: #000000;"></i>Subscriber</div>
                                        <div style="font-size: 16px"><i style="margin-right:3px " class="fa-regular fa-circle-dot" style="color: #000000;"></i>S Employee</div>
                                        <div style="font-size: 16px"><i style="margin-right:3px " class="fa-regular fa-circle-dot" style="color: #000000;"></i>Customer</div>
                                </h3>
                                
                            </div>
                            <a href="/OwnerEmployeesDashboard">
                                <span>Go to Dashboard</span>
                                <span class="icon-button">
                                    <i class="ph-caret-right-bold"></i>
                                </span>
                            </a>
                        </article>
                        <article class="tile">
                            <div class="tile-header">
                                <i class="ph-fire-simple-light"></i>
                                <h3>
                                    <span><i style="margin-right:5px;" class="fa-solid fa-shop"  style="color: #000000;" ></i>Shop</span>
                                        <div style="font-size: 16px"><i style="margin-right:3px " class="fa-regular fa-circle-dot" style="color: #000000;"></i>Shops</div>
                                        <div style="font-size: 16px"><i style="margin-right:3px " class="fa-regular fa-circle-dot" style="color: #000000;"></i>Products</div>
                                        <div style="font-size: 16px"><i style="margin-right:3px " class="fa-regular fa-circle-dot" style="color: #000000;"></i>Orders</div>
                                        <div style="font-size: 16px"><i style="margin-right:3px " class="fa-regular fa-circle-dot" style="color: #000000;"></i>Employees</div>
                                </h3>
                            </div>
                            <a href="#">
                                <span>Go to Dashboard</span>
                                <span class="icon-button">
                                    <i class="ph-caret-right-bold"></i>
                                </span>
                            </a>
                        </article>
                        
                        <article class="tile">
                            <div class="tile-header">
                                <i class="ph-file-light"></i>
                                <h3>
                                    <span><i style="margin-right:5px;" class="fa-solid fa-rectangle-ad"  style="color: #969593;" ></i>Ads</span>
                                        <div style="font-size: 16px"><i style="margin-right:3px " class="fa-regular fa-circle-dot" style="color: #000000;"></i>Current Ads</div>
                                        <div style="font-size: 16px"><i style="margin-right:3px " class="fa-regular fa-circle-dot" style="color: #000000;"></i>Waiting Ads</div>
                                        <div style="font-size: 16px"><i style="margin-right:3px " class="fa-regular fa-circle-dot" style="color: #000000;"></i>Expired Ads</div>
                                </h3>
                            </div>
                            <a href="#">
                                <span>Go to Dashboard</span>
                                <span class="icon-button">
                                    <i class="ph-caret-right-bold"></i>
                                </span>
                            </a>
                        </article>
                        <article class="tile">
                            <div class="tile-header">
                                <i class="ph-file-light"></i>
                                <h3>
                                    <span><i style="margin-right:5px;" class="fa-solid fa-heart" style="color: #969593;"></i> Category</span>
                                    <div style="font-size: 16px"><i style="margin-right:3px " class="fa-regular fa-circle-dot" style="color: #000000;"></i>All Categories</div>

                                </h3>
                            </div>
                            <a href="/CategoryDashboard">
                                <span>Go to Dashboard</span>
                                <span class="icon-button">
                                    <i class="ph-caret-right-bold"></i>
                                </span>
                            </a>
                        </article>
                    </div>
                    <div class="service-section-footer">
                        <p>Note: If you are an employee, you may not be able to access some pages for security reasons.</p>
                    </div>
                </section>
                <section class="transfer-section">
                    <div class="transfer-section-header">
                        <h2>Latest Ads</h2>
                        <div class="filter-options">
                            <p>Filter selected: more than 100 $</p>
                            <button class="icon-button">
                                <i class="ph-funnel"></i>
                            </button>
                            <button class="icon-button">
                                <i class="ph-plus"></i>
                            </button>
                        </div>
                    </div>
                    <div class="transfers">
                        <div class="transfer">
                            <div class="transfer-logo">
                                <img src="https://assets.codepen.io/285131/apple.svg" />
                            </div>
                            <dl class="transfer-details">
                                <div>
                                    <dt>Apple Inc.</dt>
                                    <dd>Apple ID Payment</dd>
                                </div>
                                <div>
                                    <dt>4012</dt>
                                    <dd>Last four digits</dd>
                                </div>
                                <div>
                                    <dt>28 Oct. 21</dt>
                                    <dd>Date payment</dd>
                                </div>
                            </dl>
                            <div class="transfer-number">
                                - $ 550
                            </div>
                        </div>
                        <div class="transfer">
                            <div class="transfer-logo">
                                <img src="https://assets.codepen.io/285131/pinterest.svg" />
                            </div>
                            <dl class="transfer-details">
                                <div>
                                    <dt>Pinterest</dt>
                                    <dd>2 year subscription</dd>
                                </div>
                                <div>
                                    <dt>5214</dt>
                                    <dd>Last four digits</dd>
                                </div>
                                <div>
                                    <dt>26 Oct. 21</dt>
                                    <dd>Date payment</dd>
                                </div>
                            </dl>
                            <div class="transfer-number">
                                - $ 120
                            </div>
                        </div>
                        <div class="transfer">
                            <div class="transfer-logo">
                                <img src="https://assets.codepen.io/285131/warner-bros.svg" />
                            </div>
                            <dl class="transfer-details">
                                <div>
                                    <dt>Warner Bros.</dt>
                                    <dd>Cinema</dd>
                                </div>
                                <div>
                                    <dt>2228</dt>
                                    <dd>Last four digits</dd>
                                </div>
                                <div>
                                    <dt>22 Oct. 21</dt>
                                    <dd>Date payment</dd>
                                </div>
                            </dl>
                            <div class="transfer-number">
                                - $ 70
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="/js/all.min.js"> </script>

    <script src="/js/cruds/homecrud.js"> </script>   
</body>
</html>