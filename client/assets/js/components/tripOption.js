import React from 'react'
import { render } from 'react-dom'
import emoji from 'node-emoji'
import randomcolor from 'randomcolor'



export default React.createClass({
  generateTags(tags) {
    var self = this;
    var tag_elems = tags.map(function(word) {
      return (<div className='keyword'>{word}</div>)
    });
    return tag_elems;
  },
  render() {
    var trip = this.props.trip;
    var dep = trip.departure,
        ret= trip.return,
        dest = trip.destination;
    var tags = this.generateTags(dest.tags);
    var style = {
      color: randomcolor({hue: "blue"})
    }

    return (
      <div className="trip-option">
        <div className="location">
          <h1> {dep.departure_airport_leave} {emoji.get('arrow_right')} <span style={style}>{dep.arrival_airport_leave}</span></h1>
          <sub className="subscript">Travel to <b> {dest.city} </b></sub>
          <p className="description">
            {dest.description}
          </p>
          <div className="dest-keywords">
            {tags}
          </div>
        </div>
        <div className="price">
          <table className="price-breakdown">
            <tr>
              <td className="label">Hotel</td>
              <td>+ $300</td>
            </tr>
            <tr>
              <td className="label">Flight</td>
              <td>+ {dep.depart_price}</td>
            </tr>
          </table>
          <h1> $1000 </h1>
        </div>
      </div>
    )
  }
})