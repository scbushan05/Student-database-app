/**
 * 
 */
(function($){
	$.fn.myFunction = function(data, response){
		$("#dialog-2").html(
				"<table class='table'><tr><th>Username<td>:</td></th><td>&nbsp;"+data.userName+"</td></tr>"+
					"<tr><th>First Name<td>:</td></th><td>&nbsp;"+data.firstName+"</td></tr>"+
					"<tr><th>Last Name<td>:</td></th><td>&nbsp;"+data.lastName+"</td></tr>"+
					"<tr><th>Email<td>:</td></th><td>&nbsp;"+data.email+"</td></tr>"+
					"<tr><th>Date Of Birth<td>:</td></th><td>&nbsp;"+data.dateOfBirth+"</td></tr>"+
					"<tr><th>Gender<td>:</td></th><td>&nbsp;"+data.gender+"</td></tr>"+
					"<tr><th>Hobbies<td>:</td></th><td>&nbsp;"+data.hobbies+"</td></tr>"+
					"<tr><th>State<td>:</td></th><td>&nbsp;"+data.state+"</td></tr>"+
					"<tr><th>City<td>:</td></th><td>&nbsp;"+data.city+"</td></tr>"+
					"<tr><th>Skills<td>:</td></th><td>&nbsp;"+data.skills+"</td></tr>"+
					"</table>"
			);
		$("#dialog-2").dialog("open");
	}
})(jQuery);	
$(function() {
	window.history.forward();
	function noBack() { 
		window.history.forward();
	}
});

$('th').css('background-color', '#f2f2f2');

(function($){
	$.fn.close = function() {
		var a = $(this).attr('title');
		$('#'+a).click(function(){
			$('#msgBlock').hide();
		});
	}
})(jQuery);

/*});*/