import React from 'react'
import { render } from 'react-dom'
import Option from './option'


export default React.createClass({
  generateTrips(data) {
    var temp = ["t1","t2","t3","t4","t5","t6","t6","t8","t9","t10"];
    var trip_elems = temp.map(function(opp) {
      return   <Option key={opp} />
    })
    return trip_elems;
  },
  render() {
    var trips = this.generateTrips();
    console.log(trips);
   return (
    <div className="trip-container">
         {trips}
    </div>
    )
  }
})