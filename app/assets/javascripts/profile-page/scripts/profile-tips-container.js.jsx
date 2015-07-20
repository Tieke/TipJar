var TipsContainer = React.createClass({
	loadTipsFromServer: function() {
		var tips_url = this.props.url + "/tips/given"
		$.ajax({
			url: tips_url,
			datatype: 'json',
			cache: false,
			success: function(data) {
				this.setState({data: data});
				// console.log("loadTipsFromServer: ", data)
			}.bind(this),
			error: function(err) {
				// alert('TipsContainer FAIL');
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
		// setInterval(this.loadTipsFromServer, 5000)
	},
	render: function() {
		if (this.state.data.length > 0) {
			// console.log("this.state.data: ", this.state.data)
			// console.log("YEPYEPYEPYEPYEPYEPYEP")
			return (
				<div className="tips_container col-lg-12">
					<ProfileTipCreator data={this.state.data} />
				</div>
			);
		} else {
			return <div className="tips_container col-lg-12">Loading....</div>
		} 
	}
})