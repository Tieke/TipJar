var ProfileTipCreator = React.createClass({
	render: function() {
		var tipNodes = this.props.data.map(function(tip, index) {
	    var receiverUrl = "/users/" + tip.receiver.id 
	    var giverUrl = "/users/" + tip.giver.id
	    var tipImage = {
        backgroundImage: 'url(' + tip.tip.link_thumbnail + ')'
      }
	    return (
	    <div className='single_tip_container' receiver={tip.receiver.userName} key={index}>
          <a className='external_link' href={tip.tip.url}><h2 className="tip_attributes external_link">{tip.tip.link_title}</h2></a>
          <p className="tip_attributes link_description">{tip.tip.link_description}</p>
          <div className='tip_attributes_container_image' style={tipImage}>
            <div className='tip_attributes_container'>
              <div className='tippee_attributes_container'>
                <p>By</p>
                <a className='tippee_profile_link profile_link' href={receiverUrl}><h2 className="tip_attributes tippee_username">{tip.receiver.userName}</h2></a>
              </div>  
              <div className='tipper_attributes_container'>
                <p className='tipster'>Tipster</p>
                <a className='tipper_profile_link profile_link' href={giverUrl}><h4 className="tip_attributes">{tip.giver.userName}</h4></a>
                <p className="time">{tip.tip.created_at}</p> 
              </div>
            </div>  
          </div>
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