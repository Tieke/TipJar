$(document).ready(function(){
	// renderProfile();
	//when we get /template

	if (window.location.pathname === '/browse') {
		renderFeed('/tips');
		// $('#main-body').removeClass('.col-lg-12').css({
		// 	'width' : '100%'
		// });
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

  var another_users_pathname 

  $(document).on('click', '.profile_filter',  function(e){
  	e.preventDefault();
    var clicks = $(this).data('clicks');

    if (clicks){
    	renderProfile(another_users_pathname, "/tips/received")
 			$(this).attr('value', 'Tips Given')
    } else {
			renderProfile(another_users_pathname, "/tips/given")
    	$(this).attr('value', 'Tips Received')
    }
    $(this).data("clicks", !clicks);
  })

	// jQuery listener on our filter button
		// when we hit 'all' we want to call renderFeed('/tips')
		// when we hit 'following' we want to call 

	if (window.location.pathname === '/') {
		renderWelcomeTips();
	}

	$(document).on('click', '.profile_link', function(e) {
		e.preventDefault()
		another_users_pathname  = $(this).context.pathname
		renderProfile(another_users_pathname )
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

