function postage_calc (){
  const get_price = document.getElementById("item-price");
  const tax_calc = document.getElementById("add-tax-price");
  const calc_result = document.getElementById("profit");
  get_price.addEventListener("input", () => {
    const InputValue = get_price.value;
    tax_calc.innerHTML = InputValue * 0.1;
    const Tax = tax_calc.innerHTML;
    calc_result.innerHTML = InputValue - Tax;
  })
}


window.addEventListener('load', postage_calc);