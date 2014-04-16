
  $(function() {  	
  	$(".hidden").hide();

    $( "a#timer-button" )
	.button()
  	.click(function( event ) {    	
    	$( "a#timer-button" ).button( "option", "disabled", true );
    	$( "a#timer-button" ).hide();
    	setTimeout(function() { 
    		$(".hidden").show(); $("#answer").focus(); 
    		var answer_id = $( ".question" ).attr("id");
    		$.getJSON('/do/not/show/answer/' + answer_id + '/to/user', function(res) {console.log(res);});
    	}, 60000);    	
    	event.preventDefault();
  	});

    $( "a#next-button" ).button();

  });
