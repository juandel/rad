$(function(){
  calc = new MoonPhase.Calculator();
  moonDay = calc.getMoonPhase(new Date());
  simbols = $("#simbols");
  if((moonDay=='new Moon')||(moonDay=='1 day past new Moon')||(moonDay=='2 days past new Moon')){
    simbols.css({'background-position':'0 -260px'});
  }else if((moonDay=='3 days past new Moon')||(moonDay=='3 days before first quarter')||(moonDay=='2 days before first quarter')){
    simbols.css({'background-position':'0 -50px'});
  }else if((moonDay=='1 day before first quarter')||(moonDay=='first quarter')||(moonDay=='1 day past first quarter')||(moonDay=='2 days past first quarter')){
    simbols.css({'background-position':'0 -80px'});
  }else if((moonDay=='3 days before full Moon')||(moonDay=='2 days before full Moon')||(moonDay=='1 day before full Moon')){
    simbols.css({'background-position':'0 -110px'});
  }else if((moonDay=='full Moon')||(moonDay=='1 day past full Moon')){
    simbols.css({'background-position':'0 -140px'});
  }else if((moonDay=='2 days past full Moon')||(moonDay=='3 days past full Moon')||(moonDay=='2 days before last quarter')||(moonDay=='1 day before last quarter')){
    simbols.css({'background-position':'0 -170px'});
  }else if((moonDay=='last quarter')||(moonDay=='1 day past last quarter')||(moonDay=='2 days past last quarter')||(moonDay=='3 days before new Moon')){
    simbols.css({'background-position':'0 -200px'});
  }else if((moonDay=='2 days before new Moon')||(moonDay=='1 day before new Moon')){
    simbols.css({'background-position':'0 -230px'});
  }
})