var PersonalInfoContainer = React.createClass({
	render: function() {
		
		if (this.props.data) {
			return (
				<div className="personal_info_container col-lg-6">
					<div className="personal_info col-lg-3">
						<img className="profile_image" src={this.props.data.image_url} alt="Profile Image" />
						<h2 className='profile_name'>{this.props.data.full_name}</h2>
						<h4 className='profile_username'>{this.props.data.username}</h4>
					</div>
					<div className="account_info col-lg-3">
						<h4> Account Info </h4>
					</div>
				</div>
			);
		}
	}
});