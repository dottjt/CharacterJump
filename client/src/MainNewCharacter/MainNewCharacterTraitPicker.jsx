import React, { Component } from 'react';

import './MainNewCharacter.css';


class MainNewCharacterTraitPicker extends Component {

  constructor() {
    super();
  }

  render() {

    let { selectedTraits, selectedCategory, categories, traits } = this.props.state.reducer;
    let { selectTrait, removeTrait, selectCategory } = this.props.actions; 
    
    return (
      <div className="MNCTP">

        <div className="MNCTP-selected-traits">
          {selectedTraits.length > 0
          ?
          selectedTraits.map(trait => (
              <div className="MNCTP-selected-trait" key={trait.name}>
                <p>{trait.name}</p>
                <button onClick={() => removeTrait(trait.name)}>
                  -
                </button>
              </div>
            )
          )
          :
          <p>
            No traits selected
          </p>  
          }
        </div>

        <div className="MNCTP-filters">
          
          <div className="MNCTP-search">
            <h3 className="MNCTP-search-title">search.</h3>
            <input className="MNCTP-search-bar" type="text"/>
          </div>

          <div className="MNCTP-categories">
            {categories.length > 0
            ? 
              categories.map(category => (
                (category.display_name == selectedCategory.display_name)
                ?
                  <div className="MNCTP-category MNCTP-category-selected" key={category.display_name} onClick={() => selectCategory(category.display_name)}>
                    {category.display_name}
                  </div>
                :
                  <div className="MNCTP-category" key={category.display_name} onClick={() => selectCategory(category.display_name)}>
                    {category.display_name}
                  </div>
              )  
            )
            :
            <p>No categories selected</p>
            }
          </div>
        </div> {/* MNCTP-top */}

        <div className="MNCTP-traits">
          {traits.map((trait, i) => (
              <div className="MNCTP-trait" key={i} onClick={() => selectTrait(trait)}>
                {trait.display_name}
              </div>
            )
          )
          }
        </div>

      </div> /* MNCTP */
    );
  }
}

export default MainNewCharacterTraitPicker;
