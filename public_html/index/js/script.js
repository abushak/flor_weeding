$(document).ready(function(){
	
	$(window).scroll(function(){
		var scrolled = $(window).scrollTop();
		$(".bg").css("top",-(scrolled*0.2)+"px");
	});
	
	$(".logo").mouseover(function(){
		$(this).addClass("swing");
	});
	
	$(".logo").mouseout(function(){
		$(this).removeClass("swing");
	});
	
})