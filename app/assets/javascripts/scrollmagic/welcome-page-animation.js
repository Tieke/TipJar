$(document).ready(function() {

if (window.location.pathname === '/') {

	// --------------------- controller -------------------------

		var controller = new ScrollMagic.Controller(
			{
				globalSceneOptions: {
					triggerHook: 'onLeave'
				}	
			}
		);

	// --------------------- header  -------------------------

		var topperTween = TweenMax.to('#topper', 1.4,
			{
				backgroundPosition: '50% '+ '-'+$('#topper').height() * 0.2 + 'px',
				ease: Cubic.ease,
				z: 1,
				opacity: 0
			}
		);

		var headingTween = TweenMax.to('#topper img, #topper p', 1,
	    {
	        y: 150
	    }
		);

		var logoScene = new ScrollMagic.Scene(
	    {
	        triggerElement: '#topper',
	        offset: '10px'
	    }
		)
		.setTween([topperTween, headingTween])
		.addTo(controller);
		

	// --------------------- welcome container  -------------------------
		
		var welcomeContainerTween = TweenMax.to('.welcome_container', 1.4,
			{
				y: '-105%'
			}
		);
		
		var welcomeSlideScene = new ScrollMagic.Scene(
			{
				triggerElement: '#topper',
				offset: '10px',
			}
		)
		.setTween(welcomeContainerTween)
		.setPin('.welcome_container')
		.addTo(controller);


		// --------------------- force scroll to top  -------------------------

		$("html,body").animate({scrollTop: 0}, 100)
	}
})