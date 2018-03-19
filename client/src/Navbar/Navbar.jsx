// Libraries
import React, { Component } from 'react';
import { Link } from 'react-router-dom';

// Components


// CC
import './Navbar.css';

class Navbar extends Component {
  render() {
    return (
      <div className="Nav">
        <div className="Nav-left">
          <img className="Nav-logo" src="" alt=""/>
          <Link to="/">Home</Link>
          <a href="/guides">Guides</a>
        </div>

        <div className="Nav-right">
          <a href=""></a>

          <div className="Nav-avatar">
            <img src="" alt=""/>
          </div>
        </div>
      </div>    
    );
  }
}

export default Navbar;
