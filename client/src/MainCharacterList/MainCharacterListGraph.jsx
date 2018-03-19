import React, { Component } from 'react';
import { LineChart } from 'react-chartjs';

class MainCharacterListGraph extends Component {
  render() {

    // render graph information

    return (
      <div className="MCLG">        
        <div className="MCLG-top">
          <div className="MCLG-top-left" >
            <div>graph.</div>
            <div>list.</div>
          </div>

          <div className="MCLG-top-right" >
            <div>filter.</div>
          </div>
        </div>

        <div className="MCLG-graph" >
          {/* <LineChart data={} options={} /> */}
        </div>
      </div>
    );
  }
}

export default MainCharacterListGraph;
