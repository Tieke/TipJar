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
			var userImage = {
				backgroundImage: 'url(' + user.image_url + ')'
			}
			return(
				<a href="#" className='follow_link' >
					<div className='follow_container follow_image' id={user.id} style={userImage}>
						<div className='follow_attributes_container'>
							<p id={user.id} className='follow_username'>{user.username}</p>
						</div>
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
