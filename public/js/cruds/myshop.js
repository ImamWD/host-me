function api()
{
    const formData = new FormData();
    formData.append('Auth', localStorage.getItem('token'));
    formData.append('Sid', localStorage.getItem('shopId'));

    fetch('api/oneshop',
     {
        method: 'POST',
        body: formData
    }) .then(response => response.json())
      .then(data => setinfo(data))
      .catch();   
}
api()
function setinfo(data)
{
    console.log(data);
    let userImg = document.getElementById('profile');
    let username = document.getElementById('UNAME');
    let shopname = document.getElementById('shopname');
    let ShopImage = document.getElementById('shopImage');
    let ShopName = document.getElementById('ShopName');
    let ShopImage1 = document.getElementsByClassName('large-banner');
    let CatName = document.getElementById('catName');
    let CatImage = document.getElementById('CatImage');
    let productImage = document.getElementById('productimage');
    let EmployeesImage = document.getElementById('Employees');
    let ads = document.getElementById('ads');
    let orders = document.getElementById('orders');


    
    for (const key in data)
    {
       // alert(data[key]['UIMAGE']);
        userImg.style.backgroundImage=`url('http://localhost:8000${data[key]['UIMAGE']}')`;
        username.innerHTML=data[key]['UNAME'];
        shopname.innerHTML=data[key]['Name'];
        ShopImage.style.backgroundImage=`url('http://localhost:8000${data[key]['logourl']}')`;
        ShopImage1[0].style.backgroundImage=`url('http://localhost:8000${data[key]['logourl']}')`;
        ShopName.innerHTML=data[key]['Name'];
        CatName.innerHTML=data[key]['CNAME'];
        CatImage.style.backgroundImage=`url('http://localhost:8000${data[key]['Cimage']}')`;
        productImage.style.backgroundImage=`url('http://localhost:8000/storage/image1.png')`;
        EmployeesImage.style.backgroundImage=`url('http://localhost:8000/storage/Company.png')`;
        ads.style.backgroundImage=`url('http://localhost:8000/storage/ads.png')`;
        orders.style.backgroundImage=`url('http://localhost:8000/storage/orders.png')`;



    }
}