import React from 'react'
import { render } from 'react-dom'
import TripOption from './tripOption'
import emoji from 'node-emoji'
import NoTrips from './noTrips'



export default React.createClass({
  //trips is an array of trip objects
  componentWillReceiveProps() {
    console.log('recieving new props');
    console.log(this.props.data);
  },
  generateTrips(trips) {
    var trip_elems;
    if(Object.keys(trips).length === 0) {
      console.log("no data");
    } else {
      var trip_elems = trips.map(function(elem) {
        return  (<TripOption key={elem.trip.departure.arrival_airport_leave} trip={elem.trip} />)
      })
    }
    console.log(trip_elems);
    return trip_elems;
  },
  render() {
    var children = this.props.data !== null ? this.generateTrips(this.props.data): () => { return (<NoTrips />)};
    console.log('children');console.log(children);
   return (
    <div className="trip-container">
      <header>
        <h2>{emoji.get('mag')}&nbsp;&nbsp;{emoji.get('ticket')}&nbsp;&nbsp;{emoji.get('airplane')}&nbsp;&nbsp;{emoji.get('information_desk_person')}</h2>
      </header>
         {children}
    </div>
    )
  }
})