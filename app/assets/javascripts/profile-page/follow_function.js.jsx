createFollow = function(){
	$.ajax({
    url: '/users',
    dataType: 'json',
    cache: false,
    success: function(data) {
      this.setState({data: data});
      alert('YUS')
      console.log(data)
    }.bind(this),
    error: function(xhr, status, err) {
      alert('FOK')
      console.error(this.props.url, status, err.toString());
    }.bind(this)
  });
}