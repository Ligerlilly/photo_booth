
	var ready;

	ready = function () {
		$('.slide').css('height', ($(window).height() - 72));
		$('.slide').css('width', ($(window).width() - 350));
		$('.carousel').css('width',($(window).width() - 350));
	};
	
	if( ! /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
    $(document).ready(ready);
	  $(document).on('page:load', ready);
  } 
  

	
