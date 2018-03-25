// Libraries
import React, { Component } from 'react';
import { Link } from 'react-router-dom';

// Components
import CharacterNewTraitPicker from './CharacterNewTraitPicker.jsx';

// Utility
import AppTitle from '../Utility/AppTitle.jsx';
import AppTitleSecondary from '../Utility/AppTitleSecondary.jsx';
import AppText from '../Utility/AppText.jsx';

// CSS
import './Character.css';

class CharacterIndividual extends Component {
  constructor(props) {
    super(props);
    
    this.state = {
      newJournalToggle: false, 
      newAdditionalToggle: false,       
    }    
  }
  
  toggleNewJournal = () => { this.setState({newJournalToggle: !this.state.newJournalToggle}); this.props.actions.changeJournalText(""); }  
  toggleAdditional = () => { this.setState({newAdditionalToggle: !this.state.newAdditionalToggle}); this.props.actions.changeAdditionalDisplayName(""); this.props.actions.changeAdditionalText(""); }

  render() {

    let state = this.state;
    let store = this.props.state.reducer;
    let actions = this.props.actions;

    let setCharacter = store.setCharacter;

    return (
      <main>

        <AppTitle title={setCharacter.display_name} />

        <div className="CI__top">
          <div className="CI__traits">

            <TraitsTop  id={setCharacter.id}
                        name={setCharacter.name}
                        secondary_id={setCharacter.secondary_id}
                        removeCharacter={actions.removeCharacter}/>

            <TraitsList traits={setCharacter.traits}/>

          </div>

          <div className="CI__narratives">
            <NarrativesTop/>
            <NarrativesList narratives={store.narratives}/>
          </div>
        </div>

        <Description description={setCharacter.description}/>
        <Journal     journals={setCharacter.journals}/>

        <NewJournal character_id={setCharacter.character_id} 
                    inputJournalText={store.inputJournalText} 
                    changeJournalText={actions.changeJournalText} 
                    newJournal={actions.newJournal} 
                    newJournalToggle={state.newJournalToggle} />
        
      </main>
    )      
  }
}


// TRAITS

let TraitsTop = ({id, name, secondary_id, removeCharacter}) => (
  <div className="CI__traits__top">
  
    <AppTitleSecondary title="Traits"/>
    
    <div className="CI__top__buttons">
      <div className="CI__top__remove" onClick={() => removeCharacter(id)}>
        remove.
      </div>
      <Link className="CI__top__edit" to={`/characters/${secondary_id}__${name}/edit`}>
        edit.
      </Link> 
    </div>
  </div>
)

let TraitsList = ({traits}) => (
  <ul className="CI__traits__list">
    { 
      traits
    ?
      traits.map(trait => (
        <TraitsIndividual trait={trait}/>
      ))
    : 
      <div className="CI__traits__list__empty">There are no traits.</div>
    }
  </ul>
)

let TraitsIndividual = ({trait}) => (
  <li className="CI__trait__item" key={trait.id}>
    <AppText text={trait.display_name}/>
  </li> 
)


// NARRATIVES

let NarrativesTop = () => (
    <AppTitleSecondary title="Narratives"/>
)

let NarrativesList = ({narratives}) => (
  <ul className="CI__narratives__list">
    { 
      narratives
    ?
      narratives.map(narrative => (
        <li className="CI__narrative__item" key={narrative.id}>
          <AppText text={narrative.text}/>
        </li> 
      ))
    : 
      <div className="CI__narratives__list__empty" >There are no narratives.</div>
    }
  </ul>
)

let Description = ({description}) => (
  <div className="CI__description">
    <AppTitleSecondary title="Description"/>

      {
        description 
      ? 
        <AppText text={description.text}/>
      :
        <AppText text=""/>      
      }

  </div>
)

// let Additional = ({additionals}) => (
//   <div className="CI__additional">
//     <ul className="CI__additional__list">
//       { 
//         additionals
//       ?
//         additionals.map(additional => (
//           <li className="CI__additional__item" key={additional.id}>
//             <div className="CI__additional__item__top">
//               <h2 className="CI__additional__item__date">
//                 {additional.display_name}
//               </h2>
//             </div>

//             <div className="CI__additional__item__text">
//               {additional.text}
//             </div>
//           </li>
//         ))
//       :
//         ""
//       }
//     </ul>
//   </div>
// )

// let newAdditional = () => (
//     this.state.newAdditional
//   ?
//     <div className="CI__additional">
//       <div className="CI__additional__button MRC__balanced" onClick={() => this.toggleAdditional()}>
//         add additional modules. 
//       </div>
//     </div>
//   :
//     <div className="CI__new__journal" >
//       <input type="text" value={inputAdditionalDisplayName} onChange={e => changeAdditionalDisplayName(e.target.value)}/>
//       <textarea className="CI__new__journal__textarea" cols="30" rows="10" value={inputAdditionalText} onChange={e => changeAdditionalText(e.target.value)}/>
//       <div className="MRC__balanced" onClick={() => { this.toggleAdditional(); newAdditional( {display_name: inputAdditionalText, text: inputAdditionalText, character_id: character_id}, character_id) } }>
//         Save
//       </div>
//       <div className="MRC__balanced" onClick={() => this.toggleAdditional()}>
//         Cancel
//       </div>
//     </div>
// )

let Journal = ({journals}) => (
  <div className="CI__journal">
    <AppTitleSecondary title="Journal"/>
    <JournalList journals={journals}/>
  </div>
)

let JournalList = ({journals}) => (
  <ul className="CI__journal__list">
    { 
      journals
    ?
      journals.map(journal => (
        <JournalIndividual journal={journal}/>
      ))
    :
      <p>There are no journal entries.</p>
    }
  </ul>
)

let JournalIndividual = ({journal}) => (
  <li className="CI__journal__item" key={journal.id}>
    <AppText text={journal.inserted_at}/>
    <AppText text={journal.text}/>
  </li>
)

let NewJournal = ({character_id, inputJournalText, changeJournalText, newJournal, newJournalToggle}) => (
    newJournalToggle
  ?
    <div>
      <textarea className="CI__new__journal__textarea" value={inputJournalText} onChange={e => changeJournalText(e.target.value)} cols="30" rows="10"/>
      <div className="App__button" onClick={() => { this.toggleNewJournal(); newJournal( {text: inputJournalText, character_id: character_id}, character_id) } }>
        Save
      </div>
      <div className="App__button" onClick={() => this.toggleNewJournal()}>
        Cancel
      </div>
    </div>
  :
    <div>
      New Journal
    </div>
)


export default CharacterIndividual;

