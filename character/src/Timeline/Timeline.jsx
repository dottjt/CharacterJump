import React, { Component } from 'react';
import { Link } from 'react-router-dom';

// Utility
import AppTitleSecondary from '../Utility/AppTitleSecondary.jsx';
import AppTitle from '../Utility/AppTitle.jsx';
import AppTop from '../Utility/AppTop.jsx';

// CSS
import './Timeline.css';


class Timeline extends Component {
  render() {

    let store = this.props.state.reducer;

    return (
      <main>

        <AppTitle title="Timeline"/>
        <AppTop   title="New Day" link="/record"/>

        <List timeline={store.timeline} />
        
      </main>
    );
  }
}

let List = ({timeline}) => (
  <div className="Time__days">
    { timeline
    ?
      timeline.map(entry => (
        <Individual inserted_at={entry.inserted_at}
                    characters={entry.characters}/>
      ))
    :
      <div className="App__item Time__day">No day recorded.</div>
    }    
  </div>
)

let Individual = ({inserted_at, characters}) => (
  <div className="App__item">
  
    <AppTitleSecondary title={inserted_at}/>

    <div className="Time__characters">
      {characters.map((character) => (
        <Character display_name={character.display_name}/>
      ))
      }
    </div>

  </div>
)

let Character = ({display_name}) => (
  <div className="Time__character">
    <h3 className="Time__character-display_name">
      {display_name}
    </h3>
  </div>
)

export default Timeline;
