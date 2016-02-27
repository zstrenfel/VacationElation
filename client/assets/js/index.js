//import all files here for configuration through gulp
import React from 'react'
import { render } from 'react-dom'
import { Router, Route, browserHistory, IndexRoute } from 'react-router'
import App from './app.js'


render (
  <Router history={browserHistory}>
    <Route path='/' component={App}/>
  </Router>,
  document.getElementById('container')
)