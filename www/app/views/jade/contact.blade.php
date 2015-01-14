<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Laravel PHP Framework</title>
    {{ HTML::style('styles/css/contact.css'); }}
    {{ HTML::script('js/vendors/jquery/dist/jquery.min.js'); }}
</head>
<body>
<div class="wrapper">
    <h1 class="headline">Contact Us</h1>
	<form action="processForm" class="contact_form" method="post">
		<input type="text" name="first_name" placeholder="First Name">
		<input type="text" name="last_name" placeholder="Last Name">
		<input type="submit">
	</form>
	<h4 id="message"></h4>
</div>
{{ HTML::script('js/services/contactForm.js'); }}
</body>
</html>