import React, { Component } from 'react';

// components
import MainCharacterListGraph from './MainCharacterListGraph.jsx';
import MainCharacterListList from './MainCharacterListList.jsx';

// CSS
import './MainCharacterList.css';

class MainCharacterList extends Component {
  render() {
    return (
      <div className="MCL">
        <h1 className="App-title">
          Your Characters
        </h1>
        <MainCharacterListGraph {...this.props} />
        <MainCharacterListList {...this.props} />
      </div>
    );
  }
}

export default MainCharacterList;