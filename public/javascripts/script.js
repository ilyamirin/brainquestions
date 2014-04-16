
  $(function() {  	
  	$(".hidden").hide();

    $( "a#timer-button" )
	.button()
  	.click(function( event ) {    	
    	$( "a#timer-button" ).button( "option", "disabled", true );
    	$( "a#timer-button" ).hide();
    	setTimeout(function() { $(".hidden").show(); $("#answer").focus(); }, 60000);    	
    	event.preventDefault();
  	});

    $( "a#next-button" ).button();

  });
