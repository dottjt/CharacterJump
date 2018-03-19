import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class MainCharacterList extends Component {


  render() {

    let { characters } = this.props.state.reducer;

    return (
      <div className="MCLL">
        {characters
        ?
        characters.map((character) => ( 
            <div className="MCLL-item" key={character.id}>
              
              <div className="MCLL-item-top">
                <div className="MCLL-item-top-left">
                  <h2 className="MCLL-item-title">
                    {character.display_name}
                  </h2>
                  <h5 className="MCLL-item-frequency">
                    Frequency:
                  </h5>
                </div>
                <Link to={`/character-list/${character.secondary_id}-${character.name}`}>
                  view.
                </Link> 
              </div>
              
              <ul className="MCLL-item-traits">
                {(character.traits.length > 0)
                ?
                  character.traits.map((trait) => ( 
                      <li className="MCLL-item-trait" key={trait.id}>
                        {trait.display_name}
                      </li>
                    )
                )
                :
                <p>No character traits</p>
                }
              </ul>

              {character.description ? 
                <h3 className="MCLL-item-description">
                  {character.description.text}
                </h3> 
                :
                <h3 className="MCLL-item-description">
                  No Description.
                </h3>
              }
            </div> // MCLL-item
          )
        )
        :
        <p>Sorry, you have no characters</p>
        }
      </div>
    );
  }
}

export default MainCharacterList;