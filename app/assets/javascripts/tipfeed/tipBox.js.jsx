var TipBox = React.createClass({
  loadTipsFromServer: function() {
    $.ajax({
      url: this.props.url,
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
  },
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    this.loadTipsFromServer();
    // setInterval(this.loadTipsFromServer, this.props.pollInterval);
  },
  render: function() {
    if (this.state.data.length > 0) {
      return (
        <div className="tipBox">
          <form>
            <input type='submit' className='home_filter' value='Following'/>
          </form>
          <TipCreator data={this.state.data} />
        </div>
      );
    } else {
      <div>You are currently not following anyone.</div>
    }
  }
});

