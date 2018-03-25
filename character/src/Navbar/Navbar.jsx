import React, { Component } from 'react';
import { Link } from 'react-router-dom';
// components

import './Navbar.css';

class Navbar extends Component {

  render() {
           
    return (
      <nav>
        <a className="Nav__item" href="/dashboard"><li>Dashboard</li></a>
        <a className="Nav__item" href="/timeline"><li>Timeline</li></a>
        <a className="Nav__item" href="/characters"><li>Characters</li></a>
        <a className="Nav__item" href="/journals"><li>Journals</li></a>
        <a className="Nav__item" href="/analytics"><li>Analytics</li></a>
      </nav>
    );
  }
}

export default Navbar;

