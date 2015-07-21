var TipsContainer = React.createClass({
	loadTipsFromServer: function() {
		var tips_url = this.props.url + "/tips/given"
		$.ajax({
			url: tips_url,
			datatype: 'json',
			cache: false,
			success: function(data) {
				this.setState({data: data});
			}.bind(this),
			error: function(err) {
				console.error(err.toString());
		  }.bind(this)
		});
	},
	getInitialState: function() {
		return {
			data: []
		}
	},
	componentDidMount: function() {
		this.loadTipsFromServer();
		setInterval(this.loadTipsFromServer, 2000)
	},
	render: function() {
		if (this.state.data instanceof Array && this.state.data.length > 0) {
			console.log("this.state.data: ", this.state.data)
			return (
				<div className="tips_container col-lg-12">
					<ProfileTipCreator data={this.state.data} />
				</div>
			);
		} else {
			return <div className="tips_container col-lg-12 no_tips">No tips yet... :(</div>
		} 
	}
})