import React from 'react'
import { render } from 'react-dom'
import TripOption from './tripOption'
import emoji from 'node-emoji'


export default React.createClass({
  generateTrips(data) {
    var trip_elems;
    if(data === "") {
      console.log("no data");
    }
    // var temp = ["t1","t2","t3","t4","t5","t6","t7","t8","t9","t10"];
    // var trip_elems = temp.map(function(opp) {
    //   return   <TripOption key={opp} />
    // })
    return trip_elems;
  },
  render() {
    var trips;
    console.log(this.props.data);
    if (this.props.data === undefined) {
      console.log('nothing here');
    } else {
      trips = this.generateTrips(this.props.data)
    }
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