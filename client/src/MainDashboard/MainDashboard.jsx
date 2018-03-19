import React, { Component } from 'react';

import MainDashboardGraph from './MainDashboardGraph.jsx';
import MainDashboardMenu from './MainDashboardMenu.jsx';
import "./MainDashboard.css"

class MainDashboard extends Component {
  
  
  render() {

    return (
      <div className="MD">
        <h1 className="App-title">Overview</h1>
        <MainDashboardGraph {...this.props} />
        <MainDashboardMenu/>
      </div>
    );
  }
}

export default MainDashboard;
