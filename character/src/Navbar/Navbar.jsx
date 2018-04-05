import React, { Component } from 'react';
import { Link } from 'react-router-dom';
// components

import './Navbar.css';

class Navbar extends Component {

  render() {
           
    return (
      <nav className="Nav" role="navigation">
        <h1 className="Nav__logo">Character Jump</h1>

        <ul className="Nav__list">
          <a className="Nav__item" href="/dashboard"><li>Dashboard</li></a>
          <a className="Nav__item" href="/dashboard/characters"><li>Characters</li></a>
          <a className="Nav__item" href="/dashboard/journals"><li>Journals</li></a>

          <a className="Nav__item" href="/dashboard/timeline"><li>Timeline</li></a>
          <a className="Nav__item" href="/guides"><li>Guides</li></a>
          
          {/* <a className="Nav__item" href="/dashboard/analytics"><li>Analytics</li></a> */}
        </ul>
      </nav>
    );
  }
}

export default Navbar;

