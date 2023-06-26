import csrfFetch from "./csrf";

//action contstants
export const RECEIVE_NOTE = "notes/RECEIVE_NOTE";
export const RECEIVE_NOTES = "notes/RECEIVE_NOTES";
export const REMOVE_NOTE = "notes/REMOVE_NOTE";

//action creators
export const receiveNote = (note) => ({
    type: RECEIVE_NOTE,
    note: note,
});

export const receiveNotes = (notes) => ({
    type: RECEIVE_NOTES,
    notes: notes,
});

export const removeNote = (noteId) => ({
    type: REMOVE_NOTE,
    noteId: noteId,
});

//getNotes and getNote selector helper functions
export const getNote = (noteId) => (state) => (
    state.notes ? state.notes[noteId] : null
)

export const getNotes = (state) => (
    state.notes ? Object.values(state.notes) : []
)

//thunk action creators

export const fetchNotes = (recipeId) => async (dispatch) => {
    const response = await fetch(`/api/notes?recipeId=${recipeId}`);

    if (response.ok) {
        const notes = await response.json();
        dispatch(receiveNotes(notes));
        console.log("Successfully fetched notes.")
    } else {
        console.log("Failed to fetch notes.")
    }
}

export const fetchNote = (noteId) => async (dispatch) => {
    const response = await fetch(`/api/notes/${noteId}`);

    if (response.ok) {
        const note = await response.json();
        dispatch(receiveNote(note.note));
        console.log("Successfully fetched note.")
    } else {
        console.log('Note not found');
    }
}

export const createNote = (note) => async (dispatch) => {
    const {body, reviewer_name, recipe_id} = note;

    const response = await csrfFetch("/api/notes", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            body: body,
            reviewer_name: reviewer_name,
            recipe_id: recipe_id
        }),
    });

    if (response.ok) {
        const newNote = await response.json();
        dispatch(receiveNote(newNote));
        } else {
            console.log("Failed to create note.");
    }
};

export const updateNote = (note) => async (dispatch) => {

    const response = await csrfFetch(`/api/notes/${note.id}`, {
        method: "PATCH",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(note),
    });

    if (response.ok) {
        const newNote = await response.json();
        dispatch(receiveNote(newNote));
    } else {
        console.log("Failed to update note.");
    }

};

export const deleteNote = (noteId) => async (dispatch) => {
    const response = await csrfFetch(`/api/notes/${noteId}`, {
        method: "DELETE",
    });

    if (response.ok) {
        dispatch(removeNote(noteId));
    } else {
        console.log("Failed to delete note.");
    }
};

export default function notesReducer(state = {}, action) {
    let newState;

    switch (action.type) {
        case RECEIVE_NOTES:
            return action.notes;
        case RECEIVE_NOTE:
            newState = {...state};
            const noteId = action.note.id;
            newState[noteId] = action.note;
            return newState;
        case REMOVE_NOTE:
            newState = {...state};
            delete newState[action.noteId];
            return newState;
        default:
            return state;
    }
}