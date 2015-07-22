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
	loadUserStatsFromServer: function() {
		$.ajax({
			url: this.props.url + "/stats",
			datatype: 'json',
			cache: false,
			success: function(data) {
				this.setState({stats: data});
				// console.log(data)
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
		this.loadUserStatsFromServer();
		setInterval(this.loadUserDetailsFromServer, 2000);
		setInterval(this.loadUserStatsFromServer, 2000)
	},
	render: function() {
		if (this.state.data) {
			return (
				<div className="profile_info_container col-lg-12">
					<PersonalInfoContainer stats={this.state.stats} userUrl={this.props.url} data={this.state.data} />
					<Following userUrl={this.props.url}/>
					<Followers userUrl={this.props.url}/>
				</div>
			);
		} else {
			return <div>Loading... </div>
		}
	}
})