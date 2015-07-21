$(document).ready(function(){

	// renderProfile();
	//when we get /template

	if (window.location.pathname === '/browse') {
		renderFeed();
	}

	$(document).on('click', '.profile_link', function(e) {
		e.preventDefault()
		var url = $(this).context.pathname
		renderProfile(url)
		// alert("YUP")
	})

	$(document).on('click', '.external_link', function(e) {
		e.preventDefault()
		var url = $(this).context.href
		window.open(url, '_blank')
	})

	$(document).on('click', '#home_button', function(e) {
		e.preventDefault()
		renderFeed();
	})

	$(document).on('click', '#profile_button', function(e) {
		e.preventDefault()
		var url = $(this).context.pathname
		renderProfile(url)
	})


});

