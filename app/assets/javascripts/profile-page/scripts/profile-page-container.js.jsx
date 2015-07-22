var ProfilePageContainer = React.createClass({
	render: function() {
		return (
			<div className="profile_page_container col-lg-12">
				<ProfileInfoContainer url={this.props.url} />
				<form>
          <input type='submit' className='profile_filter' value='Given'/>
        </form>
				<div className="tips_container col-lg-12">
					<TipsContainer filterParam={this.props.filterParam} url={this.props.url} />
				</div>
			</div>
		)
	}
})