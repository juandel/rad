$(window).load(function(){
  thumbsContent = $('ul.thumbnails li.span');
  thumbsContainer = $('ul.thumbnails');
  resizeThumbs();
});

function resizeThumbs(){
    var windowHeight = $(window).height();

    var newHeightContent = windowHeight/1.8;
    thumbsContent.find('img').css({'height':newHeightContent, 'margin-right':'.5em'});

    var sum = 0;
    $.each(thumbsContent, function(){
      sum += $(this).width(); 
    });
		thumbsContainer.css({'width':sum});
};

var resizeTimer;
$(window).resize(function(){
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(resizeThumbs, 100);
});