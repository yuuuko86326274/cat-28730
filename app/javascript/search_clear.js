window.addEventListener('click'), function () {
  
  const clearForm = document.getElementById("js_clear_btn")

  function clearForm (form) {
    $(form)
    $('.side-search_sort').find('select').val("");
    $('.side-search__group__label').find('input').val("");
    $('.side-search__group__forms').find('input').val("");
    $('#search_submit').val("完了");
    e.preventDefault();
    return false;
  });
});