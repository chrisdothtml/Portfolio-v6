#== Contact Validation =================================================
isEmail = (email) ->
	template = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/
	template.test email

clearFlags = ->
	$('#contact-form').find('input,textarea').removeClass('error')

removeClasses = ->
	$('#contact-submit').removeClass('error').removeClass('success')

clearInputs = ->
	$('#contact-form').find('input,textarea').val('')