import React from 'react'
import { render } from 'react-dom'
import DatePicker from 'react-datepicker'
import moment from 'moment'
import Rcslider from 'rc-slider'
import randomcolor from 'randomcolor'
import classNames from 'classNames'

export default React.createClass({
  getInitialState() {
    return {
      price: "",
      startDate: moment(),
      endDate: moment(),
      max_price: 1000,
      keywords: []
    }
  },
  handleChangeStart(date) {
    this.setState({start_date: date});
  },
  handleChangeEnd(date) {
    this.setState({endDate: date}, () => console.log("end"));
  },
  handleChangePrice(price) {
    this.setState({max_price: price});
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
  generateTags() {
    var keywords = ['outdoors', 'city', 'countryside', 'nightlife', 'beach', 'mountains', 'sightseeing', 'relaxing',
                    'fresh-air'];
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
      console.log(classes);
      counter += 1;
      return (<button className={classes} name={word} style={style} onClick={self.handleClickButton} key={'b' + counter}>{word}</button>)
    });
    return tag_elems;
  },

 render() {
    var tags = this.generateTags();
    return (
      <div className="home" >
          <div className="trip-params">
          <DatePicker
              selected={this.state.startDate}
              startDate={this.state.startDate}
              endDate={this.state.endDate}
              onChange={this.handleChangeStart}
              placeholderText="Click to select a start date" />
          <DatePicker
              selected={this.state.endDate}
              startDate={this.state.startDate}
              endDate={this.state.endDate}
              onChange={this.handleChangeEnd}
              placeholderText="Click to select a end date"/>
            <label htmlFor="price"> Set Your Max Price </label>
            <Rcslider name="price" onChange={this.handleChangePrice} value={this.state.max_price} max={3000}/>
            <label htmlFor="tags"> Select Your Interests </label>
            <div className="tags">
              {tags}
            </div>
          </div>

      </div>
    )
  }
})