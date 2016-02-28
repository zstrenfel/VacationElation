import React from 'react'
import { render } from 'react-dom'
import Splash from './components/splash'
import Home from './components/home'
import TopNav from './components/top-nav'
import Footer from './components/footer'

export default React.createClass({
  getInitialState() {
    return {
    user: "s"
    }
  },
  submit(name) {
    this.setState({user: name});
  },
  render() {
    var Content;
    if (this.state.user === "") {
      Content = <Splash handleSubmit={this.submit}/>
    } else {
      Content = <Home />
    }
    return (
      <div className="app">
      <TopNav user={this.state.user} />
        {Content}
      </div>
    )
  }
})