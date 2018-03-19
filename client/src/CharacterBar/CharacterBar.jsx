import React, { Component } from 'react';
import { Link } from 'react-router-dom';
// components

import './CharacterBar.css';

class CharacterBar extends Component {

  render() {
    
    let { characters, selectedCharacters } = this.props.state.reducer;
    let { selectCharacter, unselectCharacter } = this.props.actions;
           
    return (
      <ul className="CB">
        <div className="CB-menu">
          <Link className="CB-menu-link" to="/">
            Home
          </Link>
        </div>

        { (characters.length > 0)
          ?
          characters.map((character) => (
              <li className="CB-item" key={character.id}>
                {(selectedCharacters.filter((char)=> char.id == character.id).length > 0)
                ?
                <button className="CB-item-add" onClick={() => unselectCharacter(character)}>
                  -
                </button>
                :
                <button className="CB-item-add" onClick={() => selectCharacter(character)}>
                  +
                </button>
                }
                <h6 className="CB-item-display_name">
                  {character.display_name}
                </h6>
                <Link className="CB-offscreen-show" to={`/character-list/${character.secondary_id}-${character.name}`}>
                  show. 
                </Link>
              </li>
            )
          )
          :
          <li>
            No characters
          </li>
        } 
      </ul>
    );
  }
}

export default CharacterBar;
