$(function(){
   $('#clock').countdown("2016/04/02 19:00:00", function(event) {
	   var totalHours = event.offset.totalDays * 24 + event.offset.hours;
	   $("#dias").html(event.strftime('%D'));
	   $("#horas").html(event.strftime('%H'));
	   $("#minutos").html(event.strftime('%M'));
	   $("#segundos").html(event.strftime('%S'));
   })
})