var ProfileTipCreator = React.createClass({
	render: function() {
		var tipNodes = this.props.data.map(function(tip, index) {
      var receiverUrl = "/users/" + tip.receiver.id
      var giverUrl = "/users/" + tip.giver.id
      var tipImage = {
        backgroundImage: 'url(' + tip.tip.link_thumbnail + ')'
      }
      return (
        <div className='single_tip_container' style={tipImage} receiver={tip.receiver.userName} key={index}>
          <a className='external_link' href={tip.tip.url}><h2 className="tip_attributes external_link">{tip.tip.link_title}</h2></a>
          <p className="tip_attributes link_description">{tip.tip.link_description}</p>
          <a className='profile_link' href={receiverUrl}><h2 className="tip_attributes profile_link">{tip.receiver.userName}</h2></a>
          <a className='profile_link' href={giverUrl}><h4 className="tip_attributes profile_link">{tip.giver.userName}</h4></a>
          <p className="tip_attributes time">{tip.tip.created_at}</p>
        </div>
      );
    });
		return (
			<div className="profileTipCreator" >
				{tipNodes}
			</div>
		);
	}
});