renderProfile = function(profileUrl) {
	React.render(
		<ProfilePageContainer url={profileUrl} />,
		document.getElementById('main_body')
	);
}

