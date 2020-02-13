$(document).on('turbolinks:load', ()=> {
  $('#product_price').on('keyup', function() {
    let getPrice = $(this).val();
    let commission = getPrice / 10;
    let profit = getPrice - commission;
    $('p#commision').text(commission);
    $('p#profit').text(profit);
    if($.type(getPrice) != "number"){
      return;
    };

  })
});