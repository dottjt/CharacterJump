import { SagaIterator } from 'redux-saga';
import { fork, takeLatest, all } from 'redux-saga/effects';

import {setCharacterSaga,
        setCharacterFormSaga,

        changeDisplayNameSaga,
        changeDescriptionSaga,
        changeJournalsSaga,
        changeAdditionalDescriptionsSaga,
        changeNewJournalTextSaga,
        changeNewAdditionalDescriptionDisplayNameSaga,
        changeNewAdditionalDescriptionTextSaga,
        
        selectCharacterSaga,
        unselectCharacterSaga,
        
        selectCategorySaga,
        selectTraitSaga,
        removeTraitSaga,

        newCharacterSaga,
        editCharacterSaga,
        removeCharacterSaga,

        newJournalSaga,
        editJournalSaga,
        removeJournalSaga,
        editDescriptionSaga,
        newAdditionalDescriptionSaga,
        editAdditionalDescriptionSaga,
        removeAdditionalDescriptionSaga,

        initialStateSaga } from './actions';

export default function* rootSaga() {
  yield all([

    // INITIAL STATE

    fork(initialStateSaga),

    // MNC - MainNewCharacter

    takeLatest('SET_CHARACTER', setCharacterSaga),
    takeLatest('SET_CHARACTER_FORM', setCharacterFormSaga),

    takeLatest('CHANGE_DISPLAY_NAME', changeDisplayNameSaga),
    takeLatest('CHANGE_DESCRIPTION', changeDescriptionSaga),
    takeLatest('CHANGE_JOURNALS', changeJournalsSaga),
    takeLatest('CHANGE_ADDITIONAL_DESCRIPTIONS', changeAdditionalDescriptionsSaga),

    takeLatest('CHANGE_NEW_JOURNAL_TEXT', changeNewJournalTextSaga),
    takeLatest('CHANGE_NEW_ADDITIONAL_DESCRIPTION_DISPLAY_NAME', changeNewAdditionalDescriptionDisplayNameSaga),
    takeLatest('CHANGE_NEW_ADDITIONAL_DESCRIPTION_TEXT', changeNewAdditionalDescriptionTextSaga),

    // MRC - MainRecordCharacter

    takeLatest('SELECT_CHARACTER', selectCharacterSaga),
    takeLatest('UNSELECT_CHARACTER', unselectCharacterSaga),

    // MNCTP - MainNewCharacterTraitPicker

    takeLatest('SELECT_CATEGORY', selectCategorySaga),
    takeLatest('SELECT_TRAIT', selectTraitSaga),
    takeLatest('REMOVE_TRAIT', removeTraitSaga),

    // MNCTP - ASYNC MainNewCharacterTraitPicker

    takeLatest('NEW_CHARACTER', newCharacterSaga),
    takeLatest('EDIT_CHARACTER', editCharacterSaga),
    takeLatest('REMOVE_CHARACTER', removeCharacterSaga),

    // MIC - ASYNC MainIndividualCharacter
    
    takeLatest('NEW_JOURNAL', newJournalSaga),
    takeLatest('EDIT_JOURNAL', editJournalSaga),
    takeLatest('REMOVE_JOURNAL', removeJournalSaga),
    takeLatest('EDIT_DESCRIPTION', editDescriptionSaga),
    takeLatest('NEW_ADDITIONAL_DESCRIPTION', newAdditionalDescriptionSaga),
    takeLatest('EDIT_ADDITIONAL_DESCRIPTION', editAdditionalDescriptionSaga),
    takeLatest('REMOVE_ADDITIONAL_DESCRIPTION', removeAdditionalDescriptionSaga),
  ])
}

