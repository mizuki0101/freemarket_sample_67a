// $(document).on('turbolinks:load',()=> {
//   $('li#news-content').on('click', function() {
//     console.log("Hello");
//     $(this).addClass('active');
//   });
// });

$(document).on('turbolinks:load', ()=> {
  $(function(){
    let btn = $('.news-contents');
    btn.click(function(e) {
      console.log('aaa');
      e.preventDefault();
      btn.removeClass('white');
      $(this).addClass('white');
    });

    let btn1 = $('.kaufen-contents');
    btn1.click(function(e) {
      console.log('aaa');
      e.preventDefault();
      btn1.removeClass('active');
      $(this).addClass('active');
    });

    let btn2 = $('.waren');
    btn2.click(function(e) {
      e.preventDefault();
      btn2.removeClass('rrr');
      $(this).addClass('rrr');
    });

    // let btn3 = $('li');
    // btn3.click(function(e) {
    //   e.preventDefault();
    //   btn3.removeClass('uuu')
    //   $(this).addClass('uuu')
    // })
  });
});