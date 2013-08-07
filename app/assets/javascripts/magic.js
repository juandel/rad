$(function(){
	// Cambiar el logo una vez por minuto
	brand = $('.brand');
	setInterval(function(){
		brand.css('background-position', '-47px 0px');
		setTimeout(function(){
			brand.css('background-position', '0px 0px');
		}, 500);
	}, 60000);

});