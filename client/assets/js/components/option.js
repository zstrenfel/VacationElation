import React from 'react'
import { render } from 'react-dom'


export default React.createClass({
  render() {
    return(
      <div className="trip-option">
        <div className="location">
          <h1>Location</h1>
        </div>
        <div className="price">
          <h1>$300</h1>
        </div>
        <aside className="other-info">
          other information (keywords, etx)
        </aside>
      </div>
    )
  }
})