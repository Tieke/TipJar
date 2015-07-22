var Followers = React.createClass({
	loadImagesFollower: function() {
		$.ajax({
			url : this.props.userUrl+'/followers',
			datatype: "json",
			type: "GET",
			success: function(data) {
				this.setState({data: data})
			}.bind(this),
			error: function () {
			}.bind(this)
		})
	},
	componentDidMount: function() {
		this.loadImagesFollower();
		setInterval(this.loadImagesFollower, 2000);
	},
	getInitialState: function() {
		return { data: [] }
	},
	render: function() {
		var imageNodes = this.state.data.map(function(user){
			return(
				<a href="#" className='follow_link' >
					<div className='follow_container'>
						<img id={user.id} src={user.image_url} className='follow_image'/>
						<p id={user.id} className='follow_username'>{user.username}</p>
					</div>
				</a>
			)
		})
		return (
			<div className="following col-lg-3">
				<p>Followers</p>
				{imageNodes}
			</div>
		)
	}
})
