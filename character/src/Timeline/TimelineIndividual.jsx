import React, { Component } from 'react';
import { Link } from 'react-router-dom';

// Utility
import AppTitleSecondary from '../Utility/AppTitleSecondary.jsx';
import AppTitle from '../Utility/AppTitle.jsx';
import AppTop from '../Utility/AppTop.jsx';

// CSS
import './Timeline.css';


class TimelineIndividual extends Component {
  render() {

    let store = this.props.state.reducer;

    let setTimeline = store.setTimeline;

    return (
      <main>

        <AppTitle title={setTimeline.inserted_at}/>
        
        {/* <CharacterList />

        <JournalList /> 

        <NarrativeList /> */}

      </main>
    );
  }
}


export default TimelineIndividual;
