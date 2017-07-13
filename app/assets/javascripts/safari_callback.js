$(function(){

	$('form').each(function(){

        $(this).on("mouseover",'select', function(event){
          $(this).removeAttr('style');
        });
        
        
	    $(this).on('submit', function(event) {
	        //Prevent submission if checkValidity on the form returns false.
	        
	        if ($(this).find($('select')).val()=="") {
	            event.preventDefault();
	            //Implement you own means of displaying error messages to the user here.
	            var style = {
	            	borderColor: "#F98C8C",
				    backgroundColor: "#FFEFEF",
				    color: "#FF6D6D"
	            };
	            $(this).find($('select')).css(style);
	        }false
		})
	})
})
