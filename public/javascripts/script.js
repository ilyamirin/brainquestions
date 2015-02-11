
$(function() {
    var show_the_answer = function() {
        $("#answer").show();
        $("#answer").focus();
        $( "#open-button" ).hide();
        $( "#exhausted-button" ).hide();
        $("#next-button").show();
    };

    var stop_time = function() {
        $( "#exhausted-button" ).show();
        $( "#open-button" ).hide();
    };

    $(".hidden").hide();

    $( "#open-button" ).click(function( event ) {
        show_the_answer();
        event.preventDefault();
    });

    $( "#exhausted-button" ).click(function( event ) {
        show_the_answer();
        event.preventDefault();
    });

    $( "#timer-button" ).click(function( event ) {
        $( "#timer-button" ).hide();
        $( "#open-button" ).show();
        setTimeout(stop_time, 60000);
        event.preventDefault();
    });

    $( "#next-button" ).click(function( event ) {
        window.location.href = "/";
    });
});
