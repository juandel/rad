$(function(){
  $('.sub-section').hover(function(){
    $('.work-category').fadeIn(1000);
    $(this).css({'width':'100%'});
  }, function(){
    $('.work-category').fadeOut(300);    
    $(this).css({'width':'10%'});
  })

})