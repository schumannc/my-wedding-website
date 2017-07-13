function close_div(hide_div){
  var buttom = $(hide_div).closest('.custom-table').find('input[type="radio"]');
  buttom.click(function(event){
    if(buttom.is(':checked')){
      $('#out_radio').prop("checked", true);
    }else{
      $(hide_div).removeAttr('style');
      $(hide_div).find('small.error').remove();
      $(hide_div).find('input[type="number"]').val(0.0);
      buttom.prop("checked", true);
      buttom.off('click');
    }
  });
}
//disable ajax_error
function ajax_error(hide_div){
  var ajax_form = $(hide_div).find('form');
  ajax_form.on('ajax:error', function(event, xhr, status, error){
      var erro_log = xhr.responseJSON;
      ajax_form.children("small.error").remove();
      if (!$.isEmptyObject(erro_log.valor)){
        $(hide_div).css("height","250px");
        ajax_form.prepend('<small class="error">O valor deve ser maior que zero!</small>').fadeIn();
      }
  });
}

$(function(){
    $('.custom-table').on('change', 'input[type=range]', function(){
      var prog_bar_azul = $(this).closest('.custom-table').data('arrecadado');
      var total = +$(this).closest('.presentes-form').data('cota');
      var slider = this.value;
      var calcul = total * slider/100;
      var slider_render = slider *(100-prog_bar_azul)/100;
      var input = $(this).closest('.new_line_item').find('.money');
      var prog_bar_verde = $(this).closest('.custom-table').find('.verde');
      input.val(calcul);
      prog_bar_verde.css('width', slider_render + '%');
    });

    $('.money').on('keyup', function(){
      var prog_bar_azul = +$(this).closest('.custom-table').data('arrecadado');
    	var total = +$(this).closest('.presentes-form').data('cota');
    	var valor = +$(this).val();
    	var perc = valor / total*100;
      var prog_bar_verde = $(this).closest('.custom-table').find('.verde');
      var range = $(this).closest('.custom-table').find('input[type="range"]');
      
      if ((perc+prog_bar_azul<100)){
        prog_bar_verde.css('width', perc + '%');
      }else{
        prog_bar_verde.css('width', (100-prog_bar_azul) + '%');
      };
      
      range[0].value = perc;
    	
    });

    $('.hide-content').on('transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd', 
      function(){ 
      close_div(this); 
    });
}); 

