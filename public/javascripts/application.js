$(document).ready(function() {
	$('#logout').bind("ajax:success", function() {
		window.location = "/";
	});
});