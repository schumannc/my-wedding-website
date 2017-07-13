$(function(){
//Ajax
	$('#new_message').on('ajax:success', function() {
    
	    $('#msg_sending').stop(true,true).fadeOut(function(){
			$('#msg_success').fadeIn();
		});
      
	}).on('ajax:beforeSend', function(){
		$('input[type=text]').val("");
	    $('input[type=email]').val("");
		$('textarea').val("");
		$('#msg-2').prop("checked", true);
			
		$('#msg_success').stop(true,true).fadeOut(function(){
			$('#msg_sending').fadeIn();
		});
		
	}).on('ajax:error', function(event, xhr, status, error) {
		$('#msg_sending').stop(true,true).fadeOut();
	});

});

