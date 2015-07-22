renderFeed = function(filter_url) {
	React.render(
	  <TipBox url={filter_url} pollInterval={2000} />,
		  document.getElementById('main_body')
	);
}