var ProfileTipCreator = React.createClass({
	render: function() {
			var tipNodes = this.props.data.map(function(tip, index) {
	      var receiverUrl = "/users/" + tip.receiver.id 
	      var giverUrl = "/users/" + tip.giver.id
	      return (
        <div className='single_tip_container' receiver={tip.receiver.userName} key={index}>
          <a className='external_link' href={tip.tip.url}><h2 className="tip_attributes">{tip.tip.link_title}</h2></a>
          <a className='profile_link' href={receiverUrl}><h2 className="tip_attributes">{tip.receiver.userName}</h2></a>
          <a className='profile_link' href={giverUrl}><h4 className="tip_attributes">{tip.giver.userName}</h4></a>
          <p className="tip_attributes">{tip.tip.created_at}</p> 
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