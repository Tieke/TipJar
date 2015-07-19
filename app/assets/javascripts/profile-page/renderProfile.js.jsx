renderProfile = function(profileUrl) {
	React.render(
		<ProfileInfoContainer url={profileUrl} />,
		document.getElementById('main_body')
	);
}