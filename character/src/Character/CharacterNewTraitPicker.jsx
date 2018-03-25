import React, { Component } from 'react';

// Utility
import AppTitleSecondary from '../Utility/AppTitleSecondary.jsx';

// CSS
import './Character.css';


class CharacterNewTraitPicker extends Component {

  render() {

    let state = this.state;
    let store = this.props.state.reducer;
    let actions = this.props.actions;
    
    return (
      <div className="CNTP">

        <AppTitleSecondary title="Traits"/>
        <SelectedTraits selectedTraits={store.selectedTraits} removeTrait={actions.removeTrait}/>

        <div className="CNTP__filters">
          <Search/>
          <CategoryBar categories={store.categories} selectedCategory={store.selectedCategory} selectCategory={actions.selectCategory}/>
        </div> 
        
        <TraitSelection traits={store.traits} selectTrait={actions.selectTrait}/>

      </div>
    );
  }
}

let SelectedTraits = ({selectedTraits, removeTrait}) => (
  <div className="CNTP__selected__traits">
    {
      selectedTraits.length > 0
    ?
      selectedTraits.map(trait => (
        <SelectedTrait trait_id={trait.id}
                       display_name={trait.display_name}
                       removeTrait={removeTrait}/> 
      ))
    :
      <p>No traits selected</p>  
    }
  </div>
)

let SelectedTrait = ({trait_id, display_name, removeTrait}) => (
  <div className="CNTP__selected__trait" key={trait_id}>
    <p>{display_name}</p>
    <div onClick={() => removeTrait(trait_id)}>-</div>
  </div>
)

let Search = () => (
  <div className="CNTP__search">
    <input className="CNTP__search__input" type="text" placeholder="search"/>
  </div>
)

let CategoryBar = ({categories, selectedCategory, selectCategory}) => (
  <div className="CNTP__categories">
    {
      categories.length > 0
    ? 
      categories.map(category => (
        <Category selected_category_id={selectedCategory.id}
                  category={category}
                  selectCategory={selectCategory} />
      ))
    :
      <p>No categories selected</p>
    }
  </div>
)

let Category = ({selected_category_id, category, selectCategory}) => (
  category.id == selected_category_id
  ?
    <div className="CNTP__category CNTP__category__selected" key={category.id} onClick={() => selectCategory(category)}>
      {category.display_name}
    </div>
  :
    <div className="CNTP__category" key={category.id} onClick={() => selectCategory(category)}>
      {category.display_name}
    </div>
)

let TraitSelection = ({traits, selectTrait}) => (
  <div className="CNTP__traits">
    {
      traits.length > 0
    ?
      traits.map((trait) => (
        <TraitSelect trait={trait} selectTrait={selectTrait}/>
      ))
    :
      ""
    }
  </div>
)

let TraitSelect = ({trait, selectTrait}) => (
    trait.selected
  ?
    ""
  :
    <div className="CNTP__trait" key={trait.id} onClick={() => selectTrait(trait)}>
      {trait.display_name}
    </div>
)

export default CharacterNewTraitPicker;


