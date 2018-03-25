import React, { Component } from 'react';

// Utility
import AppTitle from '../Utility/AppTitle.jsx';
import AppTitleSecondary from '../Utility/AppTitleSecondary.jsx';

// CSS
import './Journal.css';


class JournalNew extends Component {

  render() {

    let store = this.props.state.reducer;
    let actions = this.props.actions;

    // let date = `${new Date().setDate()}-${new Date().setMonth()}-${new Date.setFullYear()}`;

    return (
      <main>
        
        <AppTitle title="New Journal"/>

        {/* <AppTitleSecondary title={date}/> */}

        <InputFields  inputJournalText={store.inputJournalText}
                      changeJournalText={actions.changeJournalText}/>
                      
        <div className="App__button" onClick={() => actions.newJournal( {text: store.inputJournalText}, "" ) }>
          Save
        </div>

      </main>
    )
  }
}

let InputFields = ({inputJournalText, changeJournalText}) => (
  <textarea className="JN__input" value={inputJournalText} onChange={e => changeJournalText(e.target.value)} cols="30" rows="10"/>
)

export default JournalNew;
