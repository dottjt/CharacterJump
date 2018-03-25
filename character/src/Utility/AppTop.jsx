import React, { Component } from 'react';
import { Link } from 'react-router-dom';

let AppTop = ({title, link}) => (
  <div className="App__top">
    <Link className="App__button" to={`${link}`}>
      {title}
    </Link>
  </div>
)

export default AppTop
