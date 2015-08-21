scrollSpeed = 750
scrollSpeedSlow = 900
animSpeed = 200

$(window).bind "load", ->
	if $('#bad-ie').length < 1
		$('body').removeClass 'loading'
		$('#main-overlay').remove()

$(document).ready ->

	#== Header Scrolled ====================================================
	$(window).scroll ->
		if $(window).scrollTop() > 0 then $('header').addClass('scrolled') else $('header').removeClass('scrolled')

	$(window).scroll()

	#== Mobile Nav =========================================================
	$('#nav-toggle').click ->
		$('header').toggleClass 'open'

	$('nav ul li,#nav-overlay').click ->
		$('header').removeClass 'open'

	#== Back to Top ========================================================
	$(window).scroll ->
		if $(window).scrollTop() > 200 then $('#back-to-top').addClass('show') else $('#back-to-top').removeClass('show')

	$('#back-to-top,#main-logo').click ->
		$.scrollTo '#home', scrollSpeed

	#== Landing 'Learn More' ===============================================
	$('#contact-me').click ->
		$.scrollTo '#contact', scrollSpeedSlow

	#== Contact Validation =================================================
	$('#contact-submit').click (e) ->
		e.preventDefault()
		clearFlags()
		error = false
		errors = '#contact-submit'

		if $('#contact-name').val().length < 1
			error = true
			errors += ',#contact-name'

		if $('#contact-email').val().length < 1 or not isEmail $('#contact-email').val()
			error = true
			errors += ',#contact-email'

		if $('#contact-subject').val().length < 1
			error = true
			errors += ',#contact-subject'

		if $('#contact-message').val().length < 21
			error = true
			errors += ',#contact-message'

		if error is true
			$(errors).addClass 'error'
		else
			$.post 'inc/php/sendMail.php',
				"name": $('#contact-name').val()
				"email": $('#contact-email').val()
				"subject": $('#contact-subject').val()
				"message": $('#contact-message').val()
			, (data) ->
				$('#contact-submit').addClass 'success'
				clearInputs()

		setTimeout removeClasses, 3000