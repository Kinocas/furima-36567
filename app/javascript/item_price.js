function price_calc(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('keyup', () => {
    const InputValue = priceInput.value;
    const handlingChargeCalc = parseInt(InputValue / 10);
    const profitCalc = parseInt(InputValue - handlingChargeCalc);
    const addTaxPrice = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');
    addTaxPrice.innerHTML = handlingChargeCalc ;
    profit.innerHTML = profitCalc ;
  });
};

window.addEventListener('load',price_calc);