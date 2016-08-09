$('.captcha-data').bind("click",function(){
			var rnd=Math.floor(Math.random()*4+1);
		  $(this).attr('src','./images/captcha'+rnd+'.png');
});