// Libraries
import React, { Component } from 'react';
import { Link } from 'react-router-dom';

// Components
import MainNewCharacterTraitPicker from '../MainNewCharacter/MainNewCharacterTraitPicker.jsx';

// CSS
import './MainIndividualCharacter.css';

// import createHistory from 'history/createBrowserHistory'
// let history = createHistory();
// history.listen(() => console.log("cakecakecake"))


class MainIndividualCharacter extends Component {
  constructor(props) {
    super(props);
    
    this.state = {
      newJournal: false, 
      editJournal: false, 
      editIndividualJournal: false, 

      newDescription: false,       
      editDescription: false, 
    }    
  }
  
  toggleNewJournal = () => this.setState({newJournal: !this.state.newJournal});  
  toggleEditJournal = () => this.setState({editJournal: !this.state.editJournal});
  toggleEditIndividualJournal = () => this.setState({editIndividualJournal: !this.state.editIndividualJournal});
  toggleNewDescription = () => this.setState({newDescription: !this.state.newDescription});
  toggleEditDescription = () => this.setState({editDescription: !this.state.editDescription});

  render() {

    let { journals, description, traits, display_name, name, secondary_id, id } = this.props.state.reducer.setCharacter;
    
    let character_id = id;

    let { selectedNewJournalText,
          selectedAdditionalDescriptionDisplayName,
          selectedAdditionalDescriptionText,

          selectedJournals,
          selectedAdditionalDescriptions } = this.props.state; 

    let { removeCharacter, 

          changeJournals,
          changeAdditionalDescriptions,
      
          changeNewJournalText,
          changeNewAdditionalDescriptionDisplayName,
          changeNewAdditionalDescriptionText,
        
          newJournal,
          editJournal,
          removeJournal,
          editDescription,
          newAdditionalDescription,
          editAdditionalDescription,
          removeAdditionalDescription } = this.props.actions;

    return (
      <div className="MIC">
        <h1 className="App-title">
          {display_name}
        </h1>

        <div className="App-top-gap">
        </div>

        {/* TRAITS */}

        <div className="MIC-graph">
          <div className="MIC-traits">
            <div className="MIC-traits-top">
              <h2 className="MIC-traits-title">
                Traits 
              </h2>

              <div>
                <div className="MIC-traits-edit" onClick={() => removeCharacter(id)}>
                  remove.
                </div>
                <Link className="MIC-traits-edit" to={`/character-list/${secondary_id}-${name}/edit`}>
                  edit.
                </Link> 
              </div>
            </div>

            <ul className="MIC-traits-list">
              {traits
              ?
                traits.map((trait, i) => (
                    <li className="MIC-trait-item" key={i}>
                      <h3 className="MIC-trait-item-display_name">
                        {trait.display_name}
                      </h3>
                    </li> 
                  )
                )
              : 
                <p>There are no traits.</p>
              }
            </ul>
          </div>

        </div>

        {/* DESCRIPTION */}

        <div className="MIC-description">
          <div className="MIC-description-top">
            <h2 className="MIC-description-title">
              Description 
            </h2>
            {this.state.editDescription
            ?
              <div className="MIC-description-edit" onClick={() => this.toggleEditDescription()}>
                save
              </div>
            :
              <div className="MIC-description-edit" onClick={() => this.toggleEditDescription()}>
                edit
              </div>
            }
          </div>

          <p className="MIC-description-text">
            {description ? description.text : ""}
          </p>
        </div>


        {/* NEW ADDITIONAL DESCRIPTIONS */}

        {this.state.editDescription
        ?
          <div className="MIC-additional">
            <div className="MIC-additional-button MRC-balanced">
              add additional modules. 
            </div>
          </div>
        :
          <div></div>
        }


        {/* EDIT JOURNALS */}
        
        <div className="MIC-journal">
          <div className="MIC-journal-top">
            <h2 className="MIC-journal-title">
              Journal
            </h2>
            <div className="MIC-journal-edit" onClick={() => this.toggleEditJournal()}>
              edit
            </div>
          </div>

          <ul className="MIC-journal-list">
            {journals
            ?
              journals.map(journal => (
                  <li className="MIC-journal-item" key={journal.id}>
                    <div className="MIC-journal-item-top">
                      <p className="MIC-journal-item-date">
                        {journal.inserted_at}
                      </p>
                      {this.state.editJournal
                      ?
                        <div className="MIC-journal-item-buttons">
                          <div className="MIC-journal-item-edit" onClick={() => this.toggleEditIndividualJournal()}>
                            edit.
                          </div>
                          <div className="MIC-journal-item-delete" onClick={() => removeJournal(journal.id)}>
                            delete.
                          </div>
                        </div>
                      :
                        <div></div>
                      }

                    </div>
                    {(this.state.editIndividualJournal && 1111111111 ) 
                    ?
                      <textarea name="" id="" cols="30" rows="10"/>
                    :
                      <div className="MIC-journal-item-text">
                        {journal.text}
                      </div>
                    }
                  </li>
                )
              )
            :
              <p>There are no journal entries.</p>
            }
          </ul>
        </div>


        {/* NEW JOURNAL */}

        {this.state.newJournal
        ?
          <div className="MIC-new-journal" >
            <textarea className="MIC-new-journal-textarea" name="" id="" cols="30" rows="10" value={selectedNewJournalText} onChange={(e) => changeNewJournalText(e.target.value)}/>
            <div className="MRC-balanced" onClick={() => { this.toggleNewJournal(); newJournal(selectedNewJournalText, character_id) } }>
              Save
            </div>
            <div className="MRC-balanced" onClick={() => this.toggleNewJournal()}>
              Cancel
            </div>
          </div>
        :
          <div></div>
        }

        <div className="MIC-additional">
          {this.state.newJournal
          ?
            <div></div>
          :
            <div className="MIC-additional-button MRC-balanced" onClick={() => this.toggleNewJournal()}>
              new journal entry. 
            </div>
          }
        </div>
        
      </div>
    )      
  }
}

export default MainIndividualCharacter;



function MainIndividualCharacterState(state) {

}