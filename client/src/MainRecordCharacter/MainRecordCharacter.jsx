import React, { Component } from 'react';
import './MainRecordCharacter.css';
import { Link } from 'react-router-dom';

class MainRecordCharacter extends Component {
  render() {

    let { selectionCharacters, selectedCharacters } = this.props.state.reducer;
    let { selectCharacter, unselectCharacter } = this.props.actions;

    return (
      <div className="MRC">
        <h1 className="App-title">Record Your Characters</h1>
        <div className="App-top-gap">
        </div>
        <h2 className="MRC-selected-characters-heading">Character Paths</h2>
        <div className="MRC-selected-characters">
          {(selectedCharacters.length > 0)
          ?
            selectedCharacters.map((selectedCharacter) => (
              <div className="MRC-selected-character" key={selectedCharacter.id} onClick={() => unselectCharacter(selectedCharacter)}>
                <div className="MRC-selected-character-minus-symbol">
                  -
                </div>
                <h4>
                  {selectedCharacter.display_name}
                </h4>
              </div>
              )
            )
          :
            <div className="MRC-no-selected-characters">
              <p className="MRC-no-selected-text">No characters recorded today.</p>
              <div className="MRC-balanced">
                I was balanced
              </div>
            </div>
          }
        </div>
        <h2 className="MRC-selection-characters-heading">Character List</h2>
        <div className="MRC-character-list">
          {(selectionCharacters.length > 0)
          ?
            selectionCharacters.map((selectionCharacter) => (
                <div className="MRC-character" key={selectionCharacter.id} onClick={() => selectCharacter(selectionCharacter)}>
                  <div className="MRC-character-add-symbol">
                    +
                  </div>
                  <h4>
                    {selectionCharacter.display_name}
                  </h4>
                </div>
              )
            )
          :
           <div>
             <h4 className="MRC-no-selected-text">Require additional characters?</h4>
             <Link className="MRC-balanced" to="/new-character">Create additional characters</Link>
           </div>
          }
        </div>
      </div>
    );
  }
}

export default MainRecordCharacter;
