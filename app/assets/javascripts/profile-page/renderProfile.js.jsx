renderProfile = function(profileUrl, filterParam) {
	React.render(
		<ProfilePageContainer url={profileUrl} filterParam={filterParam} />,
		document.getElementById('main_body')
	);
}

// renderProfile = function(profileUrl, filter) {
// 	React.render(
// 		<ProfilePageContainer filterParam={filter} url={profileUrl} />,
// 		document.getElementById('main_body')
// 	);
// }

