var PersonalInfoContainer = React.createClass({
	render: function() {
		// console.log(this.props)
		if (this.props.userUrl === $("#profile_button")[0].pathname && this.props.stats) {
			return (
				<div className="personal_info_container col-lg-6">
					<div className="personal_info col-lg-3">
						<img className="profile_image" src={this.props.data.image_url} alt="Profile Image" />
						<h2 className='profile_name'>{this.props.data.full_name}</h2>
						<h4 className='profile_username'>{this.props.data.username}</h4>
						<h6 className='about'>{this.props.data.about}</h6>
						<p className='tip_stats'>Tips Given: {this.props.stats.num_of_tips_given}</p>
						<p className='tip_stats'>Tips Received: {this.props.stats.num_of_tips_recieved}</p>
						<p className='member_since'>Member Since: {this.props.data.created_at}</p>
					</div>
					<div className="account_info col-lg-3">
						<h4 className='balance'>Current Balance: $ {this.props.data.balance}</h4>
					</div>
				</div>
			);
		} else if (this.props.stats){
			return (
				<div className="personal_info_container col-lg-6">
					<div className="personal_info col-lg-3">
						<img className="profile_image" src={this.props.data.image_url} alt="Profile Image" />
						<h2 className='profile_name'>{this.props.data.full_name}</h2>
						<h4 className='profile_username'>{this.props.data.username}</h4>
						<h6 className='about'>{this.props.data.about}</h6>
						<p className='tip_stats'>Tips Given: {this.props.stats.num_of_tips_given}</p>
						<p className='tip_stats'>Tips Received: {this.props.stats.num_of_tips_recieved}</p>
						<p className='member_since'>Member Since: {this.props.data.created_at}</p>
					</div>
					<form className="account_info col-lg-3" > 
						<input className="follow_button" id={this.props.userUrl} type="submit" value='Follow'/>
					</form>
				</div>
			)
		} else {
			return <div></div>
		}
	}
});