var Following = React.createClass({
	loadImagesFollowing: function() {
		$.ajax({
			url : this.props.userUrl+'/following',
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
		this.loadImagesFollowing();
		setInterval(this.loadImagesFollowing, 2000);
	},
	getInitialState: function() {
		return { data: [] }
	},
	// user id, image, name
	render: function() {
		var imageNodes = this.state.data.map(function(user){
			return(
				<a href="#" className='follow_link' >
					<div className='follow_container'>
						<img src={user.image_url} id={user.id} className='follow_image'/>
						<p id={user.id} className='follow_username'>{user.username}</p>
					</div>
				</a>
			)
		})
		return (
			<div className="following col-lg-3">
				<p>Following</p>
				{imageNodes}
			</div>
		)
	}
})