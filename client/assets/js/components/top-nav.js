import React from 'react'
import { render } from 'react-dom'
import { browserHistory, Router, Route, IndexRoute, Link, IndexLink } from 'react-router'



export default React.createClass({

  render() {
    var links;
    if (this.props.user === "") {
      links = <li><Link to="/sign-in" activeClassName="menu-active">Sign In</Link></li>
    } else {
      links = <li><Link to="/user/settings" activeClassName="menu-active">Settings</Link></li>
    }
    return (
      <div className = 'top-nav'>
        <ul>
          {links}
        </ul>
      </div>
    )
  }
})