import React, { Component } from 'react';
import { Link } from 'react-router-dom';

// Utility
import AppTop from '../Utility/AppTop.jsx';
import AppTitle from '../Utility/AppTitle.jsx';
import AppTitleSecondary from '../Utility/AppTitleSecondary.jsx';
import AppText from '../Utility/AppText.jsx';

// CSS
import './Journal.css';

class JournalList extends Component {
  
  render() {

    let store = this.props.state.reducer;
    
    return (
      <main>
 
        <AppTitle title="Your Journals"/>
        <AppTop title="New Journal" link="/journal/new"/>
        
        <List journals={store.journals}/>

      </main>
    );  
  }
}

let List = ({journals}) => (
  <div className="App__items">
    {
      journals
    ?
      journals.map(journal => (
        <Journal journal={journal}/>
      ))
    :
      <div>You have not created any journals.</div>
    }
  </div>        
)

let Journal = ({journal}) => (
  <div className="App__item" key={journal.id}>
  
    <div className="App__item__top">
      <div className="App__item__top__left">
        <AppTitleSecondary title={journal.inserted_at}/>
      </div>

      <Link to={`/journals/${journal.inserted_at}`}>
        view.
      </Link>
    </div>

    <AppText text={journal.text}/>

  </div>
)

export default JournalList;