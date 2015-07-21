renderFeed = function(filter_url) {
	console.log(filter_url)
	// $('.tipBox').remove();
	React.render(
	  <TipBox url={filter_url} pollInterval={2000} />,
		  document.getElementById('main_body')
	);
}