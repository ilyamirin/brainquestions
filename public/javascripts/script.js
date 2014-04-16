
  $(function() {  	
  	$(".hidden").hide();

    $( "a#timer-button" )
	.button()
  	.click(function( event ) {    	
    	$( "a#timer-button" ).button( "option", "disabled", true );
    	$( "a#timer-button" ).hide();
    	setTimeout(function() { $(".hidden").show(); $(".hidden").focus(); }, 60000);    	
    	event.preventDefault();
  	});

  });
