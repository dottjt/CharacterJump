import React, { Component } from 'react';
import './Record.css';
import { Link } from 'react-router-dom';

// Components
import RecordProgressBar from './RecordProgressBar.jsx';
import { NextPage, PageLink, SlideTitle } from './RecordUtility.jsx';

// Utility
import AppTitle from '../Utility/AppTitle.jsx';

class RecordSlide3 extends Component {
  
  render() {

    let store = this.props.state.reducer;
    let actions = this.props.actions;

    return (
      <main>
        
        <AppTitle title="Step 3 - Discover patterns"/>
        
        <div className="RS__slide">

          <SlideTitle title="Did you notice any patterns or relations between characters?"/>
          <CharacterBox chooseCharacter={store.chooseCharacter}/>

          <SlideTitle title="Relations"/>
          <CharacterRelations characterRelations={store.characterRelations} />

        </div>

        <div className="RS__bottom">
          <PageLink text="previous page" link="/record/step-2" clickFunction={() => actions.pageBackward()}/>
          <PageLink text="next page" link="/record/step-3" clickFunction={() => actions.pageForward()}/>
        </div>

      </main>
    )
  }
}

let CharacterBox = ({chooseCharacter}) => {

  let selectedCharacters = chooseCharacter.filter(char => char.selected === true);

  return (
    <div className="RS__character__box">
    {selectedCharacters.map(selectedCharacter =>
      <div className="RS__box">
        {selectedCharacter.display_name}
      </div>
    )
    }
  </div>
  )
}


let CharacterRelations = ({characterRelations}) => (
  <div className="RS__character__relations">
    {characterRelations.map(characterRelation => 
      <div className="RS__character__relation">
        {characterRelation.display_name}
      </div>
    )
    }
  </div>
)


export default RecordSlide3;

