var TipBox = React.createClass({
  loadTipsFromServer: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    this.loadTipsFromServer();
    setInterval(this.loadTipsFromServer, this.props.pollInterval);
  },
  render: function() {
    return (
      <div className="tipBox">
        <TipCreator data={this.state.data} />
      </div>
    );
  }
});




{
	tips: [tipObjects......],
	givers: []
}

[
	{
		tips: tipObject,
		giver: giverObject,
		receiver: receiverObject
	},
	{

	},
]









