var ProfilePageContainer = React.createClass({
	render: function() {
		return (
			<div className="profilePageContainer col-lg-8">
				<ProfileInfoContainer url={this.props.url} />
				<div className="tips_container">
					<TipsContainer url={this.props.url} />
				</div>
			</div>
		)
	}
})