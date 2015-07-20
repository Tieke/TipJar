renderFeed = function() {
	React.render(
	  <TipBox url="/tips" pollInterval={10000} />,
		  document.getElementById('main_body')
	);
}