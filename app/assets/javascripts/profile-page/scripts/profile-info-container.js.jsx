var ProfileInfoContainer = React.createClass({
	loadUserDetailsFromServer: function() {
		$.ajax({
			url: this.props.url,
			datatype: 'json',
			cache: false,
			success: function(data) {
				this.setState({data: data});
				console.log(data)
			}.bind(this),
			error: function(err) {
				console.log('NOPE: ', err)
			}.bind(this)
		});
	},
	handleFollowSubmit: function(user_url) {
		$.ajax({
			url : user_url + "/follow",
			datatype: "json",
			type: "GET",
			success: function(data) {
				alert('YUS')
			}.bind(this),
			error: function () {
				alert('nah')
			}.bind(this)
		})
	},
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
					<PersonalInfoContainer userUrl={this.props.url} onFollowSubmit={this.handleFollowSubmit} data={this.state.data} />
					<Following />
					<Followers />
				</div>
			);
		} else {
			return <div>Loading... </div>
		}
	}
})