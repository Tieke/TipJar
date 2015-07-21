renderWelcomeTips = function() {
	React.render(
	  <WelcomeTipBox url="/tips" pollInterval={2000} />,
		  document.getElementById('rolling_tips')
	);
}