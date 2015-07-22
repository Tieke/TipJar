renderProfile = function(profileUrl, filter) {
	React.render(
		<ProfilePageContainer filterParam={filter} url={profileUrl} />,
		document.getElementById('main_body')
	);
}

