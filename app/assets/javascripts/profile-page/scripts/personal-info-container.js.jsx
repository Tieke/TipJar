var PersonalInfoContainer = React.createClass({
	render: function() {
		if (this.props.userUrl === $("#profile_button")[0].pathname ) {
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
					<div className="account_info col-lg-3">
						<h4 className='balance'>Current Balance:</h4>
					</div>
				</div>
			);
		} else {
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
					<form className="account_info col-lg-3" > 
						<input className="follow_button" id={this.props.userUrl} type="submit" value='Follow'/>
					</form>
				</div>
			)
		}
	}
});