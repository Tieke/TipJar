renderProfile = function(profileUrl, filterParam) {
	React.render(
		<ProfilePageContainer url={profileUrl} filterParam={filterParam} />,
		document.getElementById('main_body')
	);
	$("html,body").animate({scrollTop: 0}, 100)
}


