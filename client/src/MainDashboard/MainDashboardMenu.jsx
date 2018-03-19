import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class MainDashboardMenu extends Component {
  render() {
    return (
      <div className="MDM">
        <Link className="MDM-item" to='/record-character'> 
          <h3 className="MDM-title">
            Record today's characters
          </h3>
        </Link>
        <Link className="MDM-item" to='/new-character'> 
          <h3 className="MDM-title">
            Create new character
          </h3>
        </Link>
        <Link className="MDM-item" to='/character-list'> 
          <h3 className="MDM-title">
            Your characters
          </h3>
        </Link>
        <Link className="MDM-item" to='/timeline'>
          <h3 className="MDM-title">
            Daily Timeline
          </h3>
        </Link>
      </div>
    );
  }
}

export default MainDashboardMenu;
