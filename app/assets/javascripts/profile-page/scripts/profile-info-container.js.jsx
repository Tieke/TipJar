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
					<PersonalInfoContainer userUrl={this.props.url} data={this.state.data} />
					<Following userUrl={this.props.url}/>
					<Followers userUrl={this.props.url}/>
				</div>
			);
		} else {
			return <div>Loading... </div>
		}
	}
})