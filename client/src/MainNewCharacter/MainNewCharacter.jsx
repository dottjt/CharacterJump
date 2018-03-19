import React, { Component } from 'react';

// components
import MainNewCharacterTraitPicker from './MainNewCharacterTraitPicker';

// CSS
import './MainNewCharacter.css';


class MainNewCharacter extends Component {

  constructor(props) {
    super(props);

    this.state = { editPage: (this.props.match.url.split("/")[3] === "edit") ? true : false }; 
  }

  shouldComponentUpdate(nextProps, nextState) {
    let reducer = this.props.state.reducer;
    if (reducer.selectedDisplayName !== nextProps.state.reducer.selectedDisplayName) return true;
    if (reducer.selectedDescription !== nextProps.state.reducer.selectedDescription) return true;
    if (reducer.selectedTraits !== nextProps.state.reducer.selectedTraits) return true;
    if (reducer.selectedCategory !== nextProps.state.reducer.selectedCategory) return true;
    return false;      
  }
 
  render() {

    let { editPage } = this.state;
    let { selectedDisplayName, selectedDescription, selectedTraits } = this.props.state.reducer;
    let { traits, id } = this.props.state.reducer.setCharacter;
    let { newCharacter, editCharacter, changeDescription, changeDisplayName } = this.props.actions;

    let character = {
      display_name: selectedDisplayName,
      description: selectedDescription,
      traits: selectedTraits
    }

    return (
      <div className="MNC">

        {editPage
        ?
          <h1 className="App-title">Edit Character</h1>
        :
          <h1 className="App-title">New Character</h1>
        }

        <div className="App-top-gap">
        </div>

        <div className="MNC-fields">
          
          <div className="MNC-field">
            <p className="MNC-field-name">Name</p>
            <input className="MNC-field-name-input" type="text" name="display_name" id="" value={selectedDisplayName} onChange={(e) => changeDisplayName(e.target.value)}/>
          </div>

          <div className="MNC-field">
            <p className="MNC-field-description">Description</p>
              <textarea className="MNC-field-description-input" type="text" name="description" id="" value={selectedDescription} onChange={(e) => changeDescription(e.target.value)}/>
          </div>
          
          <p className="MNC-field-traits">Traits</p>
        </div>

        <MainNewCharacterTraitPicker {...this.props}/>
        
        <div className="MNC-save-container">
          {editPage
          ?
            <div className="MRC-balanced" onClick={() => editCharacter(character, id)}>
                Edit. 
            </div>
          :
            <div className="MRC-balanced" onClick={() => newCharacter(character)}>
                Save. 
            </div>
          }
        </div>

      </div>
    );
  }
}

export default MainNewCharacter;
