import { categories, traits } from './state';
import { LOCATION_CHANGE } from 'react-router-redux'

let initialState = {
  user: {},
  characters: [],
  timeline: [],

  setCharacter: {},

  selectedCharacters: [],
  selectionCharacters: [],

  traits: traits,
  categories: categories,

  selectedCharacterId: "",
  selectedDisplayName: "",
  selectedDescription: "",
  selectedTraits: [],
  selectedCategory: {display_name: "all"},

  selectedJournals: [],
  selectedAdditionalDescriptions: [],

  selectedNewJournalText: "",
  selectedAdditionalDescriptionDisplayName: "",
  selectedAdditionalDescriptionText: ""
}


function reducer(state = initialState, action) {
  switch (action.type) {

    // MNC - MainNewCharacter

    case 'SET_CHARACTER_SUCCESS':
      return {
        ...state,
        setCharacter: state.characters.filter((char) => char.secondary_id == action.character_id)[0]
      }

    case 'SET_CHARACTER_FORM_SUCCESS':
      let setCharacter = state.characters.filter(char => char.secondary_id == action.character_id)[0]

      return {
        ...state,
        setCharacter: setCharacter,
        selectedDisplayName: setCharacter.display_name,
        selectedDescription: setCharacter.description.text, 
        selectedTraits: setCharacter.traits,
        selectedCharacterId: setCharacter.id
      }

    case 'CHANGE_DISPLAY_NAME_SUCCESS':
      return {
        ...state,
        selectedDisplayName: action.text
      }
    
    case 'CHANGE_DESCRIPTION_SUCCESS': 
      return {
        ...state,
        selectedDescription: action.text
      }
    
    case 'CHANGE_JOURNALS_SUCCESS':
      return {
        ...state,
        selectedJournals: state.selectedJournals.map(journal => {
          if(journal.id === action.journal_id) {
            journal.text = action.text
          }
        })
      }

    case 'CHANGE_ADDITIONAL_DESCRIPTIONS_SUCCESS':
      return {
        ...state,
        selectedAdditionalDescriptions: state.selectedAdditionalDescriptions.map(additional_description => {
          if(additional_description.id === action.additional_description_id) {
            additional_description.text = action.text
          }
        })
      }

    case 'CHANGE_NEW_JOURNAL_TEXT_SUCCESS':
      return {
        ...state,
        selectedNewJournalText: action.text 
      }

    case 'CHANGE_NEW_ADDITIONAL_DESCRIPTION_DISPLAY_NAME_SUCCESS':
      return {
        ...state,
        selectedAdditionalDescriptionDisplayName: action.text
      }

    case 'CHANGE_NEW_ADDITIONAL_DESCRIPTION_TEXT_SUCCESS':
      return {
        ...state,
        selectedAdditionalDescriptionText: action.text
      }




    // MRC - MainRecordCharacter 

    case 'SELECT_CHARACTER_SUCCESS': 
      return {
        ...state,
        selectedCharacters: state.selectedCharacters.concat(action.character),
        selectionCharacters: state.selectionCharacters.filter((char) => char.id !== action.character.id)
      }
    
    case 'UNSELECT_CHARACTER_SUCCESS':
      return {
        ...state,
        selectedCharacters: state.selectedCharacters.filter((char) => char.id !== action.character.id),
        selectionCharacters: state.selectionCharacters.concat(action.character)
      }


    // MNCTP - MainNewCharacterTraitPicker

    case 'SELECT_CATEGORY_SUCCESS':
      return {
        ...state,
        selectedCategory: { display_name: action.category }
      }

    case 'SELECT_TRAIT_SUCCESS':
      return {
        ...state,
        selectedTraits: state.selectedTraits.concat(action.trait)
      }

    case 'REMOVE_TRAIT_SUCCESS':
      return {
        ...state,
        selectedTraits: state.selectedTraits.filter((trait) => trait.name !== action.name)
      }


    // MNCTP - ASYNC MainNewCharacterTraitPicker

    case 'NEW_CHARACTER_SUCCESS':
      return {
        ...state,
        characters: state.characters.concat(action.character)
      }

    case 'EDIT_CHARACTER_SUCCESS': 
      let fields = {
        selectedCharacterId: state.selectedCharacterId, 
        selectedDisplayName: state.selectedDisplayName, 
        selectedDescription: state.selectedDescription, 
        selectedTraits: state.selectedTraits
      }

      return {
        ...state,
        characters: state.characters.map(character => {
          if(character.id === action.character_id) {
            // I think I need to configure this with the endpoint first. 
          }
        })
      }

      return {

      }
    
    case 'REMOVE_CHARACTER_SUCCESS':
      return {
        ...state,
        characters: state.characters.filter(char => char.id != action.character_id)
      }


    // MIC - ASYNC MainIndividualCharacter 
        
    case 'NEW_JOURNAL_SUCCESS':
      return {
        ...state,
        characters: state.characters.map(char => {
          if(char.id === action.character_id) {
            char.journals.concat(action.journal);
          }
        })
      }

    case 'EDIT_JOURNAL_SUCCESS':
      return {
        ...state, 
        characters: state.characters.map(char => {
          if(char.id === action.character_id) {
            char.journals.map(journal => {
              if(journal.id === action.journal.id) {
                journal = action.journal
              }
            })
          }
        })
      }

    case 'REMOVE_JOURNAL_SUCCESS':
      return {
        ...state,
        characters: state.characters.map(char => {
          if(char.id === action.character_id) {
            char.journals.filter(journal => journal.id !== action.journal.id)
          }
        })
      }

    case 'EDIT_DESCRIPTION_SUCCESS':
      return {
        ...state, 
        characters: state.characters.map(char => {
          if(char.id === action.character_id) {
            char.description = action.description
          }
        })
      }


    case 'NEW_ADDITIONAL_DESCRIPTION_SUCCESS':
      return {
        ...state,
        characters: state.characters.map((char) => {
          if(char.id === action.character_id) {
            char.additional_description.concat(action.additional_description);
          }
        })
      }

    case 'EDIT_ADDITIONAL_DESCRIPTION_SUCCESS':
      return {
        ...state, 
        characters: state.characters.map(char => {
          if(char.id === action.character_id) {
            char.additional_descriptions.map(additional_description => {
              if(additional_description.id === action.additional_description.id) {
                additional_description = action.additional_description
              }
            })
          }
        })
      }

    case 'REMOVE_ADDITIONAL_DESCRIPTION_SUCCESS':
      return {
        ...state,
        characters: state.characters.map(char => {
          if(char.id === action.character_id) {
            char.additional_descriptions.filter(additional_description => additional_description.id !== action.additional_description_id)
          }
        })
      }



    // INITIAL STATE 

    case 'INITIAL_STATE_SUCCESS': 
      return {
        ...state,
        characters: action.data.characters, selectionCharacters: action.data.characters, timeline: action.data.timeline
      }

      
    // ROUTER CHANGE

    case LOCATION_CHANGE:

      if(state.characters.length > 0) {
        let path = action.payload.pathname.split("/");
              
        if(path[1] === "new-character") {

          return {
            ...state,
            selectedDisplayName: "",
            selectedDescription: "",
            selectedTraits: "",
            selectedCharacterId: ""
          }
        }

        if(path[1] === "character-list") {

          // edit 
          if(path.length > 3) {
            let secondary_id = path[2].split("-")[0];
            let setCharacter = state.characters.filter(char => char.secondary_id == secondary_id)[0];

            return {
              ...state,
              setCharacter: setCharacter,
              selectedDisplayName: setCharacter.display_name,
              selectedDescription: setCharacter.description.text, 
              selectedTraits: setCharacter.traits,
              selectedCharacterId: setCharacter.id
            }
          }

          // individual
          if(path.length > 2) {
            let secondary_id = path[2].split("-")[0];
          
            return {
              ...state,
              setCharacter: state.characters.filter(char => char.secondary_id == secondary_id)[0]
            }
          }  
        }        
      }

      
    default:
      return state
  }
}

export default reducer;

  /*
    action.payload is something like:
    {
      pathname: '/',
      search: '',
      hash: '',
      state: null,
      action: 'PUSH',
      key: 'xwl8yl',
      query: {},
      $searchBase: {
        search: '',
        searchBase: ''
      }
    }
  */

