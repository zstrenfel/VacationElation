import React from 'react'
import { render } from 'react-dom'
import Splash from './components/splash'
import Home from './components/home'

export default React.createClass({
  getInitialState() {
    return {
      user: "zach",
    }
  },
  render() {
    // var Content = this.state.user === "" ? <Splash /> : <Home />;
    var Content;
    if (this.state.user === "") {
      Content = <Splash />
    } else {
      Content = <Home />
    }
    return (
      <div className="app">
        {Content}
      </div>
    )
  }
})