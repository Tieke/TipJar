var ProfilePageContainer = React.createClass({
	render: function() {
		return (
			<div className="profile_page_container col-lg-12">
				<ProfileInfoContainer url={this.props.url} />
				<div className="tips_container col-lg-12">
					<TipsContainer url={this.props.url} />
				</div>
			</div>
		)
	}
})