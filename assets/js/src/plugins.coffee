$(document).ready ->

	$("nav ul").onePageNav()

	#== Service Blocks =====================================================
	$(".service-blocks").owlCarousel
		pagination: false
		navigation: true
		navigationText: [
			'<i class="fa fa-angle-left"></i>'
			'<i class="fa fa-angle-right"></i>'
		]
		itemsCustom: [[0,1],[500,2],[800,3],[1010,4]]
		slideSpeed: 400
		afterInit: (elem) ->
			@.owlControls.prependTo elem

	#== Portfolio Tiles ====================================================
	$(".portfolio-tiles").owlCarousel
		pagination: false
		navigation: true
		navigationText: [
			'<i class="fa fa-angle-left"></i>'
			'<i class="fa fa-angle-right"></i>'
		]
		itemsCustom: [[0,1],[700,2],[1050,3]]
		slideSpeed: 400
		afterInit: (elem) ->
			@.owlControls.prependTo elem