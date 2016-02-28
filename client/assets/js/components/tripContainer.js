import React from 'react'
import { render } from 'react-dom'
import TripOption from './tripOption'
import emoji from 'node-emoji'
import NoTrips from './noTrips'
import ReactCSSTransitionGroup from 'react-addons-css-transition-group'



export default React.createClass({
  //trips is an array of trip objects
  componentWillReceiveProps() {
    if (this.props.data !== null) {
      console.log('recieved real results');
    };
  },
  componentWillUpdate() {
    console.log('updating');
  },
  generateTrips(trips) {
    var trip_elems;
    if(Object.keys(trips).length === 0) {
      console.log("no data");
    } else {
      var self = this;
      var trip_elems = trips.map(function(elem) {
        return  (<TripOption key={elem.trip.departure.arrival_airport_leave} trip={elem.trip} price={self.props.price} />)
      })
    }
    console.log(trip_elems);
    return trip_elems;
  },
  render() {
    var children = this.props.data !== null ? this.generateTrips(this.props.data) : <NoTrips />;
    console.log('children');console.log(children);
   return (
    <div className="trip-container">
      <header>
        <h2>{emoji.get('mag')}&nbsp;&nbsp;{emoji.get('ticket')}&nbsp;&nbsp;{emoji.get('airplane')}&nbsp;&nbsp;{emoji.get('information_desk_person')}</h2>
      </header>
        <ReactCSSTransitionGroup transitionName="example" transitionEnterTimeout={500} transitionLeaveTimeout={300}>
         {children}
        </ReactCSSTransitionGroup>
    </div>
    )
  }
})