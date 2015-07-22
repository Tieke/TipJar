$(document).ready(function(){
	// renderProfile();
	//when we get /template

	if (window.location.pathname === '/browse') {
		renderFeed('/tips');
	}


  $(document).on('click', '.home_filter',  function(e){
  	e.preventDefault();
    var clicks = $(this).data('clicks');
    var url = $("#profile_button")[0].pathname

    if (clicks){
    	renderFeed("/tips")
 			$(this).attr('value', 'Following')
    } else {
			renderFeed(url+"/following_tips")
    	$(this).attr('value', 'All')
    }
    $(this).data("clicks", !clicks);
  })


	if (window.location.pathname === '/') {
		renderWelcomeTips();
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

	$(document).on('click', '#home_button', function(e) {
		e.preventDefault()
		renderFeed();
	})

	$(document).on('click', '#profile_button', function(e) {
		e.preventDefault()
		var url = $(this).context.pathname
		renderProfile(url)
	})

	$(document).on('mouseover', '.single_tip_container', function() {
		$(this).find(".tip_attributes_container").show("slide", {"direction":"down"}, 500)
	})

	$(document).on('mouseleave', '.single_tip_container', function() {
		$(this).find(".tip_attributes_container").hide("slide", {"direction":"down"}, 500)
	})

	


});

