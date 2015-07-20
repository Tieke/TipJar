$(document).ready(function() {


	var controller = new ScrollMagic.Controller(
		{
			globalSceneOptions: {
				triggerHook: 'onLeave'
			}	
		}
	);

	var topperTween = TweenMax.to('#topper', 1,
		{
			backgroundPosition: '90%' + $('#topper').height() * 0.4 + 'px',
			ease: Cubic.ease,
			z: 1,
			opacity: 0
		}
	);

	var headingTween = TweenMax.to('#topper img, #topper p', 1,
    {
        y: 450
    }
	);

	var logoScene = new ScrollMagic.Scene(
    {
        triggerElement: '#topper',
        duration: '60%',
        offset: '100px'
    }
	)
	.setTween([topperTween, headingTween])
	.addIndicators()
	.addTo(controller);

	var welcomeTween = TweenMax.to('.welcome-sentence', 1,
		{
			scale: 2,
			color: '#d0d0d0',
			x: 200
		}
	);



	var welcomeContainerScene = new ScrollMagic.Scene(
		{
			triggerElement: '.header-buffer',
			offset: '115px'
		}
	)
	.setTween(welcomeTween)
	.setPin('.welcome_container')
	.addIndicators()
	.addTo(controller);

	$("html,body").animate({scrollTop: 0}, 100)
})