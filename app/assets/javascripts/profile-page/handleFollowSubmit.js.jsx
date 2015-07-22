handleFollowSubmit = function(user_url, toggle) {
	$.ajax({
		url : user_url + toggle,
		datatype: "json",
		type: "GET",
		success: function(data) {

		}.bind(this),
		error: function () {
			alert('nah')
		}.bind(this)
	})
}