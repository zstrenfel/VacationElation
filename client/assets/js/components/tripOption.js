import React from 'react'
import { render } from 'react-dom'
import randomcolor from 'randomcolor'



export default React.createClass({
  generateTags() {
    var keywords = ['outdoors', 'city', 'countryside'];
    var self = this;
    var tag_elems = keywords.map(function(word) {
      return (<div className='keyword'>{word}</div>)
    });
    return tag_elems;
  },
  render() {
    var tags = this.generateTags();
    var style = {
      color: randomcolor({hue: "blue"})
    }

    return (
      <div className="trip-option">
        <div className="location">
          <h1>SFO - <span style={style}>LAX</span></h1>
          <sub className="subscrirpt">Travel to <b> Los Angelos, California </b></sub>
          <aside className="other-info">
          other information (keywords, etx)
          </aside>
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
              <td>+ $700</td>
            </tr>
          </table>
          <h1> $1000 </h1>
        </div>
      </div>
    )
  }
})