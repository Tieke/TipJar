var TipsContainer = React.createClass({
	loadTipsFromServer: function() {
		var tips_url = this.props.url + "/tips/given"
		$.ajax({
			url: tips_url,
			datatype: 'json',
			cache: false,
			success: function(data) {
				this.setState({data: data});
				console.log("loadTipsFromServer: ", data)
			}.bind(this),
			error: function(err) {
				alert('TipsContainer FAIL');
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
		return (
			<div className="tipsContainer">
				<h3>{this.state.data.username}</h3>
				<ul>
					<li>derp</li>
					<li>shlerp</li>
					<li>hlerp</li>
					<li>blerp</li>
					<li>flerp</li>
					<li>glerp</li>
				</ul>
			</div>
		);
	}
})