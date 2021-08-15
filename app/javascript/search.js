function search_select(){
  const name_search = document.getElementById("list-name")
  const category_search = document.getElementById("list-category")
  const name_search_form = document.getElementById("search-form-name")
  const category_search_form = document.getElementById("search-form-category")
  
  category_search.addEventListener('click', ()=>{
    category_search_form.setAttribute("style", "display:block;")
    name_search_form.setAttribute("style", "display:none;")
  })
  name_search.addEventListener('click', ()=>{
    name_search_form.setAttribute("style", "display:block;")
    category_search_form.setAttribute("style", "display:none;")
  })


}


window.addEventListener('load', search_select);