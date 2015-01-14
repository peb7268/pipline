function displayMessage(resp, status){
	var $message = $('#message');
	if(resp.length > 0){
		$message.html(resp).removeAttr('class').addClass('success').fadeIn(100);
		return;
	}
	$message.html("Somethign went wrong with your request. Please try again.").removeAttr('class')
	.addClass('fail').fadeIn(100);
}

function processForm(e){
	e.preventDefault();
	var $contact_form = $('.contact_form');
	var data = $contact_form.serialize();
	var url = './' + $contact_form.attr('action');

	$.post(url, {	
		data: data
	}).done(function(resp){
		displayMessage(resp, status);
	});
}

jQuery(document).ready(function($) {
	$('.contact_form').on('submit', processForm);	
});