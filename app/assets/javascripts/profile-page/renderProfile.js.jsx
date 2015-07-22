renderProfile = function(profileUrl) {
	React.render(
		<ProfilePageContainer url={profileUrl} />,
		document.getElementById('main_body')
	);
}

// renderProfile = function(profileUrl, filter) {
// 	React.render(
// 		<ProfilePageContainer filterParam={filter} url={profileUrl} />,
// 		document.getElementById('main_body')
// 	);
// }

