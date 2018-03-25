import React, { Component } from 'react';
import { Link } from 'react-router-dom';

// Utility
import AppTop from '../Utility/AppTop.jsx';
import AppTitle from '../Utility/AppTitle.jsx';
import AppTitleSecondary from '../Utility/AppTitleSecondary.jsx';
import AppText from '../Utility/AppText.jsx';

// CSS
import './Character.css';

class CharacterList extends Component {

  render() {

    let store = this.props.state.reducer;
    
    return (
      <main>

        <AppTitle title="Your Characters"/>
        <AppTop title="New Character" link="/characters/new"/>
        <List characters={store.characters} />
      
      </main>
    );
  }
}

let List = ({characters}) => (
  <div className="App__items">
    {
      characters
    ?
      characters.map(character => (
        <Individual character={character}/>
      ))
    :
      <div>Sorry, you have no characters</div>
    }
  </div>
)

let Individual = ({character}) => (
  <div className="App__item" key={character.id}>

    <CharacterTop name={character.name} 
                  display_name={character.display_name} 
                  secondary_id={character.secondary_id}/>

    <CharacterTraits traits={character.traits}/>
    <CharacterDescription description={character.description}/>
  </div> 
)

let CharacterTop = ({name, display_name, secondary_id}) => (
  <div className="App__item__top">
    <div className="App__item__top__left">
      <AppTitleSecondary title={display_name}/>
      <h5 className="App__item-frequency">Frequency:</h5>
    </div>
    <Link to={`/characters/${secondary_id}-${name}`}>
      view.
    </Link> 
  </div>
)

let CharacterTraits = ({traits}) => (
  <ul className="CL__traits">
    {
      traits.length > 0
    ?
      traits.map((trait) => (
        <li className="CL__trait" key={trait.id}>
          {trait.display_name}
        </li>
      ))
    :
      <p>No character traits</p>
    }
  </ul>
)

let CharacterDescription = ({description}) => (
    description 
  ? 
    <AppText text={description.text}/>
  :
    <AppText text="No Description"/>
)

export default CharacterList;