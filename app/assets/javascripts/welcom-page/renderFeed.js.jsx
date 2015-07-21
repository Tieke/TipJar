renderWelcomeTips = function() {
	React.render(
	  <WelcomeTipBox url="/tips/random" pollInterval={5000} />,
		  document.getElementById('rolling_tips')
	);
}