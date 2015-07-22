$(document).ready(function(){


	if (window.location.pathname === '/browse') {
		renderFeed('/tips');
		$('.home_filter').attr('value', 'Following')
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

  $(document).on('click', '.follow_button',  function(e){
  	e.preventDefault();
    var clicks = $(this).data('clicks');
    var url = $(".follow_button").attr('id')
    if (clicks){
    	handleFollowSubmit(url, '/unfollow')
 			$(this).attr('value', 'Follow')
    } else {
    	handleFollowSubmit(url, '/follow')
    	$(this).attr('value', 'Unfollow')
    }
    $(this).data("clicks", !clicks);
  })

  $(document).on('click', '.follow_link', function(e){
  	e.preventDefault();
  	var user_id = $(e.target).attr('id')
  	renderProfile('/users/'+user_id, '/tips/given')
  })

  // var another_users_pathname 

  // $(document).on('click', '.profile_filter',  function(e){
  // 	e.preventDefault();
  //   var clicks = $(this).data('clicks');

  //   if (clicks){
  //   	renderProfile(another_users_pathname, "/tips/received")
 	// 		$(this).attr('value', 'Tips Given')
  //   } else {
		// 	renderProfile(another_users_pathname, "/tips/given")
  //   	$(this).attr('value', 'Tips Received')
  //   }
  //   $(this).data("clicks", !clicks);
  // })

	if (window.location.pathname === '/') {
		renderWelcomeTips();
	}

	$(document).on('click', '.profile_link', function(e) {
		e.preventDefault()
		another_users_pathname = $(this).context.pathname
		renderProfile(another_users_pathname, "/tips/given")
	})

	$(document).on('click', '.external_link', function(e) {
		e.preventDefault()
		var url = $(this).context.href
		window.open(url, '_blank')
	})

	$(document).on('click', '#home_button', function(e) {
		e.preventDefault()
		renderFeed('/tips');
		$('.home_filter').attr('value', 'Following')
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

