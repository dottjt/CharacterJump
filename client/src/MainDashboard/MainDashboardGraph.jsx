import React, { Component } from 'react';
import { LineChart } from 'react-chartjs';


class MainDashboardGraph extends Component {
  render() {

    // render graph information

    return (
      <div className="MDG">        
        <div className="MDG-top App-top-gap">
          <div className="MDG-top-left" >
            <div>graph.</div>
            <div>list.</div>
          </div>

          <div className="MDG-top-right" >
            <div>filter.</div>
          </div>
        </div>

        <div className="MDG-graph" >
          {/* <LineChart data={} options={}  /> */}
        </div>
      </div>
    );
  }
}

export default MainDashboardGraph;
