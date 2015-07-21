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

		var topperTween = TweenMax.to('#topper', 1,
			{
				backgroundPosition: '50% '+ '-'+$('#topper').height() * 0.3 + 'px',
				ease: Cubic.ease,
				z: 1,
				opacity: 0
			}
		);

		var headingTween = TweenMax.to('#topper img, #topper p', 1,
	    {
	        y: 300
	    }
		);

		var logoScene = new ScrollMagic.Scene(
	    {
	        triggerElement: '#topper',
	        duration: '50%',
	        // offset: '80px'
	    }
		)
		.setTween([topperTween, headingTween])
		.addIndicators()
		.addTo(controller);
		

	// --------------------- welcome container  -------------------------
		
		var welcomeContainerTween = TweenMax.to('.welcome_container', 1.4,
			{
				y: -650
			}
		);
		
		var welcomeSlideScene = new ScrollMagic.Scene(
			{
				triggerElement: '#topper',
				offset: '250px',
				// duration: '20%'
			}
		)
		.setTween(welcomeContainerTween)
		.setPin('.welcome_container')
		.addIndicators()
		.addTo(controller);

		// var welcomeTween = TweenMax.to('.welcome-sentence', 1,
		// 	{
		// 		scale: 1.5,
		// 		color: '#d0d0d0',
		// 		// x: 200
		// 	}
		// );
		
		// var welcomeSentenceTween = TweenMax.to('.welcome-sentence', 1.5,
		// 	{
		// 		// width: '100px',
		// 		// height: '100px',
		// 		y: -45
		// 	}
		// )


		// var welcomeContainerScene = new ScrollMagic.Scene(
		// 	{
		// 		triggerElement: '.wrap',
		// 		offset: '290px'
		// 	}
		// )
		// .setTween(welcomeSentenceTween)
		// .setPin('.welcome_container')
		// .addIndicators()
		// .addTo(controller);


		// --------------------- force scroll to top  -------------------------

		$("html,body").animate({scrollTop: 0}, 100)
	}
})