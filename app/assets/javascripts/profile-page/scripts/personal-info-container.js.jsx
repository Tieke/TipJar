var PersonalInfoContainer = React.createClass({
	render: function() {
		
		if (this.props.data) {
			return (
				<div className="personalInfoContainer">
					<div className="personal_info col-lg-3">
						<img src={this.props.data.image_url} alt="here is cat" />
						<h2> {this.props.data.username} </h2>
					</div>
					<div className="account_info col-lg-3">
						<h3> {this.props.data.full_name} </h3>
					</div>
				</div>
			);
		}
	}
});