var WelcomeTipCreator = React.createClass({
  render: function() {
    var tip = this.props.data
    var tipImage = {
      backgroundImage: 'url(' + tip.link_thumbnail + ')'
    }
    var tipNodes = (
        <div className='recent_tips_container' style={tipImage}>
          <a className='external_link' href={tip.url}><h2 className="tip_attributes external_link">{tip.link_title}</h2></a>
          <p className="tip_attributes link_description">{tip.link_description}</p>
          <p className="tip_attributes time">{tip.created_at}</p>
        </div>
      );
    return (
      <div className="tipList">
        {tipNodes}
      </div>
    );
  }
});



