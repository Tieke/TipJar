var WelcomeTipBox = React.createClass({
  loadTipFromServer: function() {
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
    this.loadTipFromServer();
    setInterval(this.loadTipFromServer, this.props.pollInterval);
  },
  render: function() {
    // console.log(this.state.data);
    return (
      <div className="tipBox">
        <WelcomeTipCreator data={this.state.data} />
      </div>
    );
  }
});

