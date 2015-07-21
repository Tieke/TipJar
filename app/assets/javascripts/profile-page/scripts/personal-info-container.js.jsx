var PersonalInfoContainer = React.createClass({
	// handleSubmit: function(e) {
	// 	e.preventDefault();
	// 	var user_id = React.findDOMNode(this.href)
	// 	this.props.onFollowSubmit(user_id);
	// 	return;
	// },
	render: function() {
		
		if (this.props.data) {
			return (
				<div className="personal_info_container col-lg-6">
					<div className="personal_info col-lg-3">
						<img className="profile_image" src={this.props.data.image_url} alt="Profile Image" />
						<h2 className='profile_name'>{this.props.data.full_name}</h2>
						<h4 className='profile_username'>{this.props.data.username}</h4>
						<h6 className='about'>This is where all the things will be about the user.. If they have anything to say</h6>
						<p className='tip_stats'>Tips Given</p>
						<p className='tip_stats'>Tips Received</p>
						<p className='member_since'>Member Since</p>
					</div>
					//this should not show if on another persons profile
					<div className="account_info col-lg-3">
						<h4 className='balance'>Current Balance:</h4>
					</div>
					//this should show if we are on another persons profile
					// <form className="account_info col-lg-3" onSubmit={this.handleSubmit}>
					// 	<input type="submit" value="Follow" href="*** current user id ***"/>
					// </form>
					//this should show if you are already following a persons
					// <form className="account_info col-lg-3" onSubmit={this.handleSubmit}>
					// 	<input type="submit" value="Unfollow" href="*** current user id ***"/>
					// </form>

				</div>
			);
		}
	}
});