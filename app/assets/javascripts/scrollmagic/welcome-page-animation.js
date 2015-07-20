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
			backgroundPosition: '50%' + $('#topper').height() * 0.4 + 'px',
			ease: Cubic.ease,
			z: 1
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
        offset: '100px' /* Height of viewport */
    }
	)
	.setTween([topperTween, headingTween]) /* Array of animations occur */
	.addIndicators() /* Enable dev mode */
	.addTo(controller); /* Mix it all together */

	// var headerScene = new ScrollMagic.Scene(
	// 	{
	// 		triggerElement: '#topper',
	// 		duration: '1500px',
	// 		offset: '600px'
	// 	}
	// )
	// .setPin('#topper')
	// .addIndicators()
	// .addTo(controller);

})