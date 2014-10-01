$(document).ready(function(){
	$('#changePass').click(function(){
		console.log('clicked')
		window.location.replace('login/edit');
	});
});

//Add maxlength display
$(function(){
  $('input[maxlength]').maxlength();
  
});