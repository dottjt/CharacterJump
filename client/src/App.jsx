// Libraries
import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Switch, Route, BrowserRouter as Router } from 'react-router-dom';
import { ConnectedRouter } from 'react-router-redux';
import { history } from './redux/store';
// Components
import CharacterBar from './CharacterBar/CharacterBar.jsx';
import MainCharacterList from './MainCharacterList/MainCharacterList.jsx';
import MainIndividualCharacter from './MainIndividualCharacter/MainIndividualCharacter.jsx';
import MainDashboard from './MainDashboard/MainDashboard.jsx';
import MainNewCharacter from './MainNewCharacter/MainNewCharacter.jsx';
import MainRecordCharacter from './MainRecordCharacter/MainRecordCharacter.jsx';
import MainTimeline from './MainTimeline/MainTimeline.jsx';
import NotificationBar from './NotificationBar/NotificationBar.jsx';
import Navbar from './Navbar/Navbar.jsx';
import Footer from './Footer/Footer.jsx';
import ScrollToTop from './Other/ScrollToTop.jsx';

// Actions
import {setCharacter,
        setCharacterForm,

        changeDisplayName,
        changeDescription,
        changeJournals,
        changeAdditionalDescriptions,
        changeNewJournalText,
        changeNewAdditionalDescriptionDisplayName,
        changeNewAdditionalDescriptionText,

        selectCharacter,
        unselectCharacter,

        selectCategory,
        selectTrait,
        removeTrait,

        newCharacter,
        editCharacter,
        removeCharacter, 

        newJournal,
        editJournal,
        removeJournal,
        editDescription,
        newAdditionalDescription,
        editAdditionalDescription,
        removeAdditionalDescription,



        initialState } from './redux/actions';

// CSS
import './App.css';
import './Reset.css';

class App extends Component {

  render() {
    return (
      <ConnectedRouter history={history}>
        <ScrollToTop>
          <div className="App">

            <div className="App-top">
              <Navbar {...this.props}/>
              <NotificationBar {...this.props}/>
            </div>

            <div className="App-main">
              <CharacterBar {...this.props}/>

              <Switch>
                <Route exact path="/" render={(props) => <MainDashboard {...props} {...this.props}/>}/> 

                <Route exact path="/character-list" render={(props) => <MainCharacterList {...props} {...this.props}/>}/>
                <Route exact path="/character-list/:character_name" render={(props) => <MainIndividualCharacter {...props} {...this.props}/>}/>
                <Route path="/character-list/:character_name/edit" render={(props) => <MainNewCharacter {...props} {...this.props}/>}/>
                <Route path="/new-character" render={(props) => <MainNewCharacter {...props} {...this.props}/>}/>
                <Route path="/record-character" render={(props) => <MainRecordCharacter {...props} {...this.props}/>}/>
                <Route path="/timeline" render={(props) => <MainTimeline {...props} {...this.props}/>}/>
              </Switch>
            </div>
            {/* <Footer {...this.props}/> */}
          </div>
        </ScrollToTop>        
      </ConnectedRouter>
    );
  }
}

const mapStateToProps = state => {
  return {
    state: state
  }
}

const mapDispatchToProps = dispatch => {
  return {
    actions: {
      
      // MNC - MainNewCharacter

      setCharacter: character_id => {
        dispatch(setCharacter(character_id))
      },

      setCharacterForm: character_id => {
        dispatch(setCharacterForm(character_id))
      },


      changeDisplayName: text => {
        dispatch(changeDisplayName(text))
      },

      changeDescription: text => {
        dispatch(changeDescription(text))
      },

      changeJournals: (text, journal_id) => {
        dispatch(changeJournals(text, journal_id))
      },

      changeAdditionalDescriptions: (text, additional_description_id) => {
        dispatch(changeAdditionalDescriptions(text, additional_description_id))
      },

      changeNewJournalText: (text) => {
        dispatch(changeNewJournalText(text))
      },

      changeNewAdditionalDescriptionDisplayName: (text) => {
        dispatch(changeNewAdditionalDescriptionDisplayName(text))
      },

      changeNewAdditionalDescriptionText: (text) => {
        dispatch(changeNewAdditionalDescriptionText(text))
      },

      // MRC - MainRecordCharacter 

      selectCharacter: character => {
        dispatch(selectCharacter(character))
      },

      unselectCharacter: character => {
        dispatch(unselectCharacter(character))
      },

      // MNCTP - MainNewCharacterTraitPicker

      selectCategory: category => {
        dispatch(selectCategory(category))
      },
      selectTrait: trait => {
        dispatch(selectTrait(trait))
      },
      removeTrait: name => {
        dispatch(removeTrait(name))
      },

      // MNCTP - ASYNC MainNewCharacterTraitPicker

      newCharacter: character => {
        dispatch(newCharacter(character))
      },

      editCharacter: (character, character_id) => {
        dispatch(editCharacter(character, character_id))
      },

      removeCharacter: character_id => {
        dispatch(removeCharacter(character_id))
      },

      // MIC - MainIndividualCharacter

      newJournal: (journal, character_id) => {
        dispatch(newJournal(journal, character_id))
      },

      editJournal: (journal, character_id) => {
        dispatch(editJournal(journal, character_id))
      },

      removeJournal: (journal_id, character_id) => {
        dispatch(removeJournal(journal_id, character_id))
      },


      editDescription: (description, character_id) => {
        dispatch(editDescription(description, character_id))
      },


      newAdditionalDescription: (additional_description, character_id) => {
        dispatch(newAdditionalDescription(additional_description, character_id))
      },

      editAdditionalDescription: (additional_description, character_id) => {
        dispatch(editAdditionalDescription(additional_description, character_id))
      },

      removeAdditionalDescription: (additional_description_id, character_id) => {
        dispatch(removeAdditionalDescription(additional_description_id, character_id))
      }
    }
  }
}


const AppContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(App)
 

export default AppContainer;
