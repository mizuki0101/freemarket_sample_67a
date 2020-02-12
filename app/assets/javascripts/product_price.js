$(document).on('turbolinks:load', ()=> {
  $('#product_price').on('keyup', function() {
    let getPrice = $(this).val();
    console.log(getPrice);
    let commission = getPrice / 10;
    let profit = getPrice - commission;
    console.log(commission);
    console.log(profit);
    $('p#commision').text(commission);
    $('p#profit').text(profit);
    if($.type(getPrice) != "number"){
      return;
    };

  })
});