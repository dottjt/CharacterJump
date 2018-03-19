import { put, call } from 'redux-saga/effects';
import { SagaIterator } from 'redux-saga';
import { push } from 'react-router-redux';
import axios from 'axios';



// MNC - MainNewCharacter

export const setCharacter = character_id => ({type: 'SET_CHARACTER', character_id});
export const setCharacterSuccess = character_id => ({type: 'SET_CHARACTER_SUCCESS', character_id});

export const setCharacterForm = character_id => ({type: 'SET_CHARACTER_FORM', character_id});
export const setCharacterFormSuccess = character_id => ({type: 'SET_CHARACTER_FORM_SUCCESS', character_id});

export function* setCharacterSaga(action) {
  yield put(setCharacterSuccess(action.character_id));
}
export function* setCharacterFormSaga(action) {
  yield put(setCharacterFormSuccess(action.character_id));
}


export const changeDisplayName = text => ({type: 'CHANGE_DISPLAY_NAME', text});
export const changeDisplayNameSuccess = text => ({type: 'CHANGE_DISPLAY_NAME_SUCCESS', text});

export const changeDescription = text => ({type: 'CHANGE_DESCRIPTION', text});
export const changeDescriptionSuccess = text => ({type: 'CHANGE_DESCRIPTION_SUCCESS', text});

export const changeJournals = (text, journal_id) => ({type: 'CHANGE_JOURNALS', text, journal_id});
export const changeJournalsSuccess = (text, journal_id) => ({type: 'CHANGE_JOURNALS_SUCCESS', text, journal_id});

export const changeAdditionalDescriptions = (text, additional_description_id) => ({type: 'CHANGE_ADDITIONAL_DESCRIPTIONS', text, additional_description_id});
export const changeAdditionalDescriptionsSuccess = (text, additional_description_id) => ({type: 'CHANGE_ADDITIONAL_DESCRIPTIONS_SUCCESS', text, additional_description_id});

export const changeNewJournalText = text => ({type: 'CHANGE_NEW_JOURNAL_TEXT', text});
export const changeNewJournalTextSuccess = text => ({type: 'CHANGE_NEW_JOURNAL_TEXT_SUCCESS', text});

export const changeNewAdditionalDescriptionDisplayName = text => ({type: 'CHANGE_NEW_ADDITIONAL_DESCRIPTION_DISPLAY_NAME', text});
export const changeNewAdditionalDescriptionDisplayNameSuccess = text => ({type: 'CHANGE_NEW_ADDITIONAL_DESCRIPTION_DISPLAY_NAME_SUCCESS', text});

export const changeNewAdditionalDescriptionText = text => ({type: 'CHANGE_NEW_ADDITIONAL_DESCRIPTION_TEXT', text});
export const changeNewAdditionalDescriptionTextSuccess = text => ({type: 'CHANGE_NEW_ADDITIONAL_DESCRIPTION_TEXT_SUCCESS', text});


export function* changeDisplayNameSaga(action) {
  yield put(changeDisplayNameSuccess(action.text));
}
export function* changeDescriptionSaga(action) {
  yield put(changeDescriptionSuccess(action.text));
}
export function* changeJournalsSaga(action) {
  yield put(changeJournalsSuccess(action.text, action.journal_id));
}
export function* changeAdditionalDescriptionsSaga(action) {
  yield put(changeAdditionalDescriptionsSuccess(action.text, action.additional_description_id));
}
export function* changeNewJournalTextSaga(action) {
  yield put(changeNewJournalTextSuccess(action.text));
}
export function* changeNewAdditionalDescriptionDisplayNameSaga(action) {
  yield put(changeNewAdditionalDescriptionDisplayNameSuccess(action.text));
}
export function* changeNewAdditionalDescriptionTextSaga(action) {
  yield put(changeNewAdditionalDescriptionTextSuccess(action.text));
}



// MRC - MainRecordCharacter 

export const selectCharacter = character => ({type: 'SELECT_CHARACTER', character});
export const selectCharacterSuccess = character => ({type: 'SELECT_CHARACTER_SUCCESS', character});

export const unselectCharacter = character => ({type: 'UNSELECT_CHARACTER', character});
export const unselectCharacterSuccess = character => ({type: 'UNSELECT_CHARACTER_SUCCESS', character});

export function* selectCharacterSaga(action) {
  yield put(selectCharacterSuccess(action.character));
}

export function* unselectCharacterSaga(action) {
  yield put(unselectCharacterSuccess(action.character));
}



// MNCTP - MainNewCharacterTraitPicker

export const selectCategory = category => ({type: 'SELECT_CATEGORY', category});
export const selectCategorySuccess = category => ({type: 'SELECT_CATEGORY_SUCCESS', category});

export const selectTrait = trait => ({type: 'SELECT_TRAIT', trait});
export const selectTraitSuccess = trait => ({type: 'SELECT_TRAIT_SUCCESS', trait});

export const removeTrait = name => ({type: 'REMOVE_TRAIT', name});
export const removeTraitSuccess = name => ({type: 'REMOVE_TRAIT_SUCCESS', name});

export function* selectCategorySaga(action) {
  yield put(selectCategorySuccess(action.category));
}
export function* selectTraitSaga(action) {
  yield put(selectTraitSuccess(action.trait));
}
export function* removeTraitSaga(action) {
  yield put(removeTraitSuccess(action.name));
}



// MNCTP - ASYNC MainNewCharacterTraitPicker

export const newCharacter = character => ({type: 'NEW_CHARACTER', character});
export const newCharacterSuccess = character => ({type: 'NEW_CHARACTER_SUCCESS', character});

export const editCharacter = (character, character_id) => ({type: 'EDIT_CHARACTER', character, character_id});
export const editCharacterSuccess = (character, character_id) => ({type: 'EDIT_CHARACTER_SUCCESS', character, character_id});

export const removeCharacter = character_id => ({type: 'REMOVE_CHARACTER', character_id});
export const removeCharacterSuccess = character_id => ({type: 'REMOVE_CHARACTER_SUCCESS', character_id});

let newCharacterApi = character => axios.post('http://localhost:4000/api/characters/', character);
let editCharacterApi = (character, character_id) => axios.put('http://localhost:4000/api/characters/' + character_id, character);
let removeCharacterApi = character_id => axios.delete('http://localhost:4000/api/characters/' + character_id);

export function* newCharacterSaga(action) {
    yield call(newCharacterApi, action.character);
    yield put(newCharacterSuccess(action.character));
}

export function* editCharacterSaga(action) {
  yield call(editCharacterApi, action.character, action.character_id);
  yield put(editCharacterSuccess(action.character));
}

export function* removeCharacterSaga(action) {
  yield call(removeCharacterApi, action.character_id);
  yield put(removeCharacterSuccess(action.character_id));
  // yield push('/character-list');
  // yield store.dispatch(push('/foo'))
}



// MIC - ASYNC MainIndividualCharacter 

export const newJournal = (journal, character_id) => ({type: 'NEW_JOURNAL', journal, character_id});
export const newJournalSuccess = (journal, character_id) => ({type: 'NEW_JOURNAL_SUCCESS', journal, character_id});

export const editJournal = (journal, character_id) => ({type: 'EDIT_JOURNAL', journal, character_id});
export const editJournalSuccess = (journal, character_id) => ({type: 'EDIT_JOURNAL_SUCCESS', journal, character_id});

export const removeJournal = (journal_id, character_id) => ({type: 'REMOVE_JOURNAL', journal_id, character_id});
export const removeJournalSuccess = (journal_id, character_id) => ({type: 'REMOVE_JOURNAL_SUCCESS', journal_id, character_id});


export const editDescription = (description, character_id) => ({type: 'EDIT_DESCRIPTION', description, character_id});
export const editDescriptionSuccess = (description, character_id) => ({type: 'EDIT_DESCRIPTION_SUCCESS', description, character_id});


export const newAdditionalDescription = (additional_description, character_id) => ({type: 'NEW_ADDITIONAL_DESCRIPTION', additional_description, character_id});
export const newAdditionalDescriptionSuccess = (additional_description, character_id) => ({type: 'NEW_ADDITIONAL_DESCRIPTION_SUCCESS', additional_description, character_id});

export const editAdditionalDescription = (additional_description, character_id) => ({type: 'EDIT_ADDITIONAL_DESCRIPTION', additional_description, character_id});
export const editAdditionalDescriptionSuccess = (additional_description, character_id) => ({type: 'EDIT_ADDITIONAL_DESCRIPTION_SUCCESS', additional_description, character_id});

export const removeAdditionalDescription = (additional_description_id, character_id) => ({type: 'REMOVE_ADDITIONAL_DESCRIPTION', additional_description_id});
export const removeAdditionalDescriptionSuccess = (additional_description_id, character_id) => ({type: 'REMOVE_ADDITIONAL_DESCRIPTION_SUCCESS', additional_description_id});


let newJournalApi = journal => axios.post('http://localhost:4000/api/journal/', journal);
let editJournalApi = journal => axios.put('http://localhost:4000/api/journal/' + journal.id, journal);
let removeJournalApi = journal_id => axios.delete('http://localhost:4000/api/journal/' + journal_id);

let editDescriptionApi = description => axios.put('http://localhost:4000/api/description', description);

let newAdditionalDescriptionApi = additional_description => axios.post('http://localhost:4000/api/additional_description', additional_description);
let editAdditionalDescriptionApi = additional_description => axios.put('http://localhost:4000/api/additional_description' + additional_description.id, additional_description);
let removeAdditionalDescriptionApi = additional_description_id => axios.delete('http://localhost:4000/api/additional_description/' + additional_description_id);


export function* newJournalSaga(action) {
    // journal is just text
    let data = yield call(newJournalApi, action.journal, action.character_id);
    yield put(newJournalSuccess(data.data));
}

export function* editJournalSaga(action) {
    let data = yield call(editJournalApi, action.journal, action.character_id);    
    yield put(editJournalSuccess(data.data));
}

export function* removeJournalSaga(action) {
    let data = yield call(removeJournalApi, action.journal_id);        

    yield put(removeJournalSuccess(data.data));
}


export function* editDescriptionSaga(action) {
  let data = yield call(editDescriptionApi, action.description, action.character_id);    
  yield put(editDescriptionSuccess(data.data));
}


export function* newAdditionalDescriptionSaga(action) {
  let data = yield call(newAdditionalDescriptionApi, action.additional_description, action.character_id);
  yield put(newAdditionalDescriptionSuccess(data.data));
}

export function* editAdditionalDescriptionSaga(action) {
  let data = yield call(editAdditionalDescriptionApi, action.additional_description, action.character_id);    
  yield put(editAdditionalDescriptionSuccess(data.data));
}

export function* removeAdditionalDescriptionSaga(action) {
  let data = yield call(removeAdditionalDescriptionApi, action.additional_description_id);        
  yield put(removeAdditionalDescriptionSuccess(data.data));
}





// INITIAL STATE

export const initialState = () => ({type: 'INITIAL_STATE'});
export const initialStateSuccess = data => ({type: 'INITIAL_STATE_SUCCESS', data});

let initialStateApi = () => axios.get('http://localhost:4000/api/initial_state');

export function* initialStateSaga() {
  let data = yield call(initialStateApi);

  yield put(initialStateSuccess(data.data));
  
  let path = window.location.pathname.split("/");

  if(path[1] === "character-list") {

    // edit
    if(path.length > 3) {
      let secondary_id = path[2].split("-")[0];
      yield put(setCharacterFormSuccess(secondary_id));
      return
    }

    // individual
    if(path.length > 2) {
      let secondary_id = path[2].split("-")[0];
      yield put(setCharacterSuccess(secondary_id));
    }
  }
}

