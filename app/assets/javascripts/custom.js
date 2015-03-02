
	var ready;

	ready = function () {
		$('.slide').css('height', ($(window).height() - 72));
		$('.slide').css('width', ($(window).width() - 350));
		$('.carousel').css('width',($(window).width() - 350));
	};
	
	$(function() {
		if( ! /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
      $(document).ready(ready);
      $(document).on('page:load', ready);
    }
	});
	
	
  $(document).on('page:load', function(){
    $('#day_date_of_event').datepicker({
      format: "yyyy-mm-dd",
      todayHighlight: true,
      todayBtn: 'linked',
      autoclose: true
    });
  });
 

 
  

	
