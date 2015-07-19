var ProfilePageContainer = React.createClass({
	render: function() {
		return (
			<div className="profilePageContainer">
				<ProfileInfoContainer url="http://localhost:3000/users/4" />
				<TipsContainer />
			</div>
		)
	}
})