import React from 'react'
import { render } from 'react-dom'
import TripOption from './tripOption'
import emoji from 'node-emoji'


export default React.createClass({
  generateTrips(data) {
    var temp = ["t1","t2","t3","t4","t5","t6","t7","t8","t9","t10"];
    var trip_elems = temp.map(function(opp) {
      return   <TripOption key={opp} />
    })
    return trip_elems;
  },
  render() {
    var trips = this.generateTrips();
    console.log(emoji.get('airplane'));
   return (
    <div className="trip-container">
      <header>
        <h2>{emoji.get('mag')}&nbsp;&nbsp;{emoji.get('ticket')}&nbsp;&nbsp;{emoji.get('airplane')}&nbsp;&nbsp;{emoji.get('information_desk_person')}</h2>
      </header>
         {trips}
    </div>
    )
  }
})