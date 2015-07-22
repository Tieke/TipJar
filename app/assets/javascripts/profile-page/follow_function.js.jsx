createFollow = function(){
	$.ajax({
    url: '/users',
    dataType: 'json',
    cache: false,
    success: function(data) {
      this.setState({data: data});
      console.log(data)
    }.bind(this),
    error: function(xhr, status, err) {
      console.error(this.props.url, status, err.toString());
    }.bind(this)
  });
}