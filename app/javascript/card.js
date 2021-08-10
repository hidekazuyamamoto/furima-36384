function pay (){
  Payjp.setPublicKey("pk_test_706f3e7227eac5f678aaa93d")
  const submit = document.getElementById('button')
  submit.addEventListener('click',(e) =>{
    e.preventDefault();
    const price = document.getElementsByClassName('item-payment-price')
    const price_yen = price[0].innerHTML.substr(1)
    const form_result = document.getElementById("charge-form")
    const formData = new FormData(form_result)
    const card = {
      number: formData.get("purchased_order[card_number]"),
      cvc: formData.get("purchased_order[card_cvc]"),
      exp_month: formData.get("purchased_order[card_exp_month]"),
      exp_year: `20${formData.get("purchased_order[card_exp_year]")}`,
    }
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        form_result.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      form_result.submit();
    });
  })

}

window.addEventListener('load', pay);