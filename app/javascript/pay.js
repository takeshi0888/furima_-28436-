window.addEventListener('DOMContentLoaded', () => {
  
  const pay = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const prof = document.getElementById("profit")

  pay.addEventListener('keyup', () => {
    tax.textContent = (pay.value * 0.1)
    prof.textContent = (pay.value * 0.9)
  })
})
