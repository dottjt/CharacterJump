import React, { Component } from 'react';
import { Link } from 'react-router-dom';

// Utility
import AppTitle from '../Utility/AppTitle.jsx';
import AppTop from '../Utility/AppTop.jsx';

// CSS
import "./Dashboard.css"

class Dashboard extends Component {
  
  render() {

    let store = this.props.state.reducer;

    return (
      <main>

        <AppTitle title="Overview"/>
        <AppTop title="New Day" link="/record"/>
        <CharacterList characters={store.characters}/>
        <Menu/>

      </main>
    );
  }
}

let CharacterList = ({characters}) => (
  <ul className="Dash__characters">
    { 
      characters.length > 0
    ?
      characters.map(character => (
        <IndividualCharacter character={character}/>
      ))
    :
      <li>You have no characters</li>
    }
  </ul>
)

let IndividualCharacter = ({character}) => (
  <li className="Dash__character" key={character.id}>
    <h6 className="Dash__character__display_name">
      {character.display_name}
    </h6>
    <Link className="Dash__character__link" to={`/characters/${character.secondary_id}__${character.name}`}>
      show. 
    </Link>
  </li>
)

let Menu = () => (
  <div className="Dash__menu">
    <Link className="Dash__item" to='/characters'> 
      <h3 className="Dash__item__title">
        Characters
      </h3>
    </Link>
    <Link className="Dash__item" to='/timeline'> 
      <h3 className="Dash__item__title">
        Timeline
      </h3>
    </Link>
    <Link className="Dash__item" to='/analytics'> 
      <h3 className="Dash__item__title">
        Analytics
      </h3>
    </Link>
    <Link className="Dash__item" to='/journals'>
      <h3 className="Dash__item__title">
        Journals
      </h3>
    </Link>
  </div>
)


export default Dashboard;
