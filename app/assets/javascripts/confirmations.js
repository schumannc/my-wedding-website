$(function(){
  //Ajax
	$('#new_confirmation').on('ajax:success', function(event, data, status, xhr) {
       
      $('input').not($(":submit")).val("");
      $('#confirmation_guets option[value=2]').prop('selected', true);
      
      $('input').prop("disabled", false );
      $('#confirmation_guets').prop("disabled", false );

      $('#msg_sending').stop(true,true).fadeOut(function(){
        $('#msg_success').fadeIn();
      });
      
  }).on('ajax:beforeSend', function(){
    $('input').prop("disabled", true );
    $('#confirmation_guets').prop("disabled", true );

    $('label').removeClass("error");
    $("h6.subheader").remove();

    $('#msg_success').stop(true,true).fadeOut(function(){
      $('#msg_sending').fadeIn();
    });


  }).on('ajax:error', function(event, xhr, status, error) {
     var erro_log = xhr.responseJSON

     $('input').prop("disabled", false );
     $('#confirmation_guets').prop("disabled", false );

     $('#msg_sending').stop(true,true).hide();

     if (!$.isEmptyObject(erro_log.name)){
      	$("label[for='confirmation_name']").addClass("error")
     } else if(!$.isEmptyObject(erro_log.email)){
        if (erro_log.email == "has already been taken"){
          $("#confirmation_email").after('<h6 class="subheader" style="color:red;">Esse e-mail já foi confirmado!</h6>')
        };
        $("label[for='confirmation_email']").addClass("error");
     } else if (!$.isEmptyObject(erro_log.phone)){
        $("label[for='confirmation_phone']").addClass("error")
        $("#confirmation_phone").after('<h6 class="subheader" style="color:red;">O número deve ter menos que 12 dígitos</h6>')
     }    
  });

  $("#confirmation_phone").mask("(99) 9999-9999?9");

  $("#confirmation_phone").on("blur", function() {
      var last = $(this).val().substr( $(this).val().indexOf("-") + 1 );

      if( last.length == 5 ) {
          var move = $(this).val().substr( $(this).val().indexOf("-") + 1, 1 );

          var lastfour = last.substr(1,4);
          
          var first = $(this).val().substr( 0, 9 );
          
          $(this).val( first + move + '-' + lastfour );
      }
  });
});