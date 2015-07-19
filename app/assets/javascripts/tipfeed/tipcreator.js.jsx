var TipCreator = React.createClass({
  render: function() {
    var commentNodes = this.props.data.map(function(comment, index) {
    return (
    	<div className="tipCreator">
    		// link to external webpage <a><h1>
        // link to owner of webpage profile page <a><p>
        // link to tipper <a href><p>
        // time of tip
    	</div>        
    );
  }


  displayName: 'TipCreator',
});

var TipCreator = React.createClass({
  render: function() {
    var tipNodes = this.props.data.map(function(tip, index) {
      return (
        // `key` is a React-specific concept and is not mandatory for the
        // purpose of this tutorial. if you're curious, see more here:
        // http://facebook.github.io/react/docs/multiple-components.html#dynamic-children
        <Tip author={tip.author} key={index}>
          {tip.text}
        </Comment>
      );
    });
    return (
      <div className="tipList">
        {tipNodes}
      </div>
    );
  }
});