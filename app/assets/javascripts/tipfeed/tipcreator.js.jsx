var TipCreator = React.createClass({
  render: function() {
    var tipNodes = this.props.data.map(function(tip, index) {
      return (
    		// link to external webpage <a><h1>
        // link to owner of webpage profile page <a><p>
        // link to tipper <a href><p>
        // time of tip
        <div className='single_tip_container' receiver={tip.receiver.userName} key={index}>
          <a href={tip.tip.url}><h2 className="tip_attributes">{tip.tip.url}</h2></a>
          <a href="#"><h2 className="tip_attributes">{tip.receiver.userName}</h2></a>
          <a href="#"><h4 className="tip_attributes">{tip.giver.userName}</h4></a>
          <p className="tip_attributes">{tip.tip.created_at}</p> 
        </div>
      );
    });
    return (
      <div className="tipList">
        {tipNodes}
      </div>
    );
  }
});

