$(document).ready(function(){
	// renderProfile();
	//when we get /template

	if (window.location.pathname === '/template') {
		renderFeed();
	}

	$(document).on('click', '.profile_link', function(e) {
		e.preventDefault()
		var url = $(this).context.pathname
		renderProfile(url)
	})

	$(document).on('click', '.external_link', function(e) {
		e.preventDefault()
		var url = $(this).context.href
		window.open(url, '_blank')
	})

	//listener : to the thing
	//listener : to the thing
	//listener : to the thing
});

