$(function(){
  $('.slick').slick({
      autoplay: false,
      autoplaySpeed: 3000,
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      asNavFor: '.slick-thumbnail',
  });
  
  $('.slick-thumbnail').slick({
    slidesToShow: 5,
    slidesToScroll: 1,
    asNavFor: '.slick',
    pauseOnFocus: false,
    pauseOnHover: false,
    focusOnSelect: true,
    centerMode: false,
    centerPadding: 0,
    fade: false,   
    
  }); 
  $('.slick-thumbnail').on('turbolinks:load',function(){
    var index = $(this).attr("data-index");
    $(slider).slick("slickGoTo",index,false);
  });
});  