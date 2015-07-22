var ProfileInfoContainer = React.createClass({
	loadUserDetailsFromServer: function() {
		$.ajax({
			url: this.props.url,
			datatype: 'json',
			cache: false,
			success: function(data) {
				this.setState({data: data});
			}.bind(this),
			error: function(err) {
				console.log('NOPE: ', err)
			}.bind(this)
		});
	},
	// handleFollowSubmit: function(user_id) {
	// 	$.ajax({
	// 		url : "shit",
	// 		datatype: "shit",
	// 		type: "POST",
	// 		data: user_id,
	// 		success: function() {
	// 			// check if you are already following the page you are looking at
	// 			// change the content of the button
	// 		}.bind(this),
	// 	})
	// }
	getInitialState: function() {
		return {
			data: []
		};
	},
	componentDidMount: function() {
		this.loadUserDetailsFromServer();
		setInterval(this.loadUserDetailsFromServer, 2000);
	},
	render: function() {
		if (this.state.data) {
			return (
				<div className="profile_info_container col-lg-12">
					<PersonalInfoContainer data={this.state.data} />
					//<PersonalInfoContainer userUrl={this.props.url} onFollowSubmit={this.handleFollowSubmit} data={this.state.data} />
					<Following />
					<Followers />
				</div>
			);
		} else {
			return <div>Loading... </div>
		}
	}
})