window.addEventListener('load', function(){
  
  let pay = document.getElementById("item-price")

  pay.addEventListener('keyup', function(){
    let price = document.getElementById("item-price").value;

    document.getElementById("add-tax-price").innerHTML = price * 0.1

    document.getElementById("profit").innerHTML = price * 0.9
      
  })
})
  
