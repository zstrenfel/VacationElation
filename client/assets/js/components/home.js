import React from 'react'
import { render } from 'react-dom'
import DatePicker from 'react-datepicker'
import moment from 'moment'
import Rcslider from 'rc-slider'
import randomcolor from 'randomcolor'
import classNames from 'classNames'
import TripContainer from './tripContainer'
import $ from "jquery"

export default React.createClass({
  getInitialState() {
    return {
      startDate: moment(),
      endDate: moment(),
      maxPrice: 1000,
      keywords: [],
      airport: "SFO",
      trip: {},
      url: "http://localhost:3000/planTrip"
    }
  },
  handleChangeStart(date) {
    this.setState({start_date: date});
  },
  handleChangeEnd(date) {
    this.setState({endDate: date}, () => console.log("end"));
  },
  handleChangePrice(price) {
    this.setState({maxPrice: price});
  },
  handleClickButton(e) {
    var newWords = this.state.keywords.slice(),
        word = e.target.name;
    if (this.state.keywords.indexOf(word) < 0) {
      newWords.push(word);
      this.setState({keywords: newWords});
    } else {
      console.log(this.state.keywords);
      var index = this.state.keywords.indexOf(word);
      newWords.splice(index, 1);
      this.setState({keywords: newWords});
    }
  },
  handleChangeAirport(airport) {
    this.setState({airport: airport});
  },
  submit(e) {
    var self, data;
    e.preventDefault();
    self = this;

    data = {
      startDate: self.state.startDate,
      endDate: self.state.endDate,
      maxPrice: self.state.maxPrice,
      keywords: self.state.keywords,
      airport: self.state.airport
    }

    $.ajax({
      type:'POST',
      url: self.state.url,
      data: data
    })
    .done((data) => {
      this.setState({trip: data});
    })
    .fail((err) => {
      console.log('something went wrong');
    })
  },
  generateTags() {
    var keywords = ['outdoors', 'city', 'countryside', 'nightlife', 'beach', 'mountains', 'sightseeing', 'relaxing',
                    'fresh-air', 'shopping', 'museum'];
    var self = this,
        counter = 0;
    var tag_elems = keywords.map(function(word) {
      var selected = {},
          style,
          classes;
      selected.selected = self.state.keywords.indexOf(word) > -1 ? true : false;
      style = {
        backgroundColor: randomcolor({luminosity: 'dark'})
      };
      classes = classNames('keyword', selected);
      counter += 1;
      return (<button className={classes} name={word} style={style} onClick={self.handleClickButton} key={'b' + counter}>{word}</button>)
    });
    return tag_elems;
  },
 render() {
    var tags = this.generateTags();
    return (
      <div className="home" >
          <form onSubmit={this.submit} className="trip-params">
          <div className='third'>
            <label htmlFor="airport"> Departing Airport </label>
            <input
                value={this.state.airport}
                onChange={this.handleChangeAirport}/>
          </div>
          <div className='third'>
            <label htmlFor="startDate"> Starting Avaliability </label>
            <DatePicker
                selected={this.state.startDate}
                startDate={this.state.startDate}
                endDate={this.state.endDate}
                onChange={this.handleChangeStart}
                placeholderText="Click to select a start date" />
          </div>
          <div className='third'>
          <label htmlFor="endDate"> Ending Avaliability </label>
            <DatePicker
                selected={this.state.endDate}
                startDate={this.state.startDate}
                endDate={this.state.endDate}
                onChange={this.handleChangeEnd}
                placeholderText="Click to select a end date"/>
            </div>
            <div className='third last'>
              <label htmlFor="price"> Set Your Max Price </label>
              <Rcslider name="price" onChange={this.handleChangePrice} value={this.state.maxPrice} max={3000}/>
            </div>
            <div className="full">
            <label htmlFor="tags"> Select Your Interests </label>
            <div className="tags">
              {tags}
            </div>
          </div>
          <button className={classNames('third', 'search')} type="submit"> Search </button>
        </form>
        <TripContainer />
      </div>
    )
  }
})