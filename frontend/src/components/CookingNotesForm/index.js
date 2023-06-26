
import React, { useState } from 'react';
import { useDispatch } from 'react-redux';
import { createNote, updateNote } from '../../store/notes';
import './CookingNotesForm.css'

export default function CookingNotesForm({recipeId, formType, note, setShowForm}) {
    const dispatch = useDispatch();

    if (formType === "Add Note") {
        note = {
            body:"",
            reviewer_name: "",
        }
    }

    const [body, setBody] = useState(note.body);
    const [reviewerName, setReviewerName] = useState(note.reviewerName);

    const handleSubmit = (e) => {
        e.preventDefault();

        const newNote = {
            ...note,
            body: body,
            reviewer_name: reviewerName,
            recipe_id: recipeId
        }

        if (formType === "Add Note") {
            dispatch(createNote(newNote))
        } else {
            dispatch(updateNote(newNote))
            setShowForm(false);
        }

        setBody("");
        setReviewerName("");
    }

    if (formType === "Add Note") {
        return (
            <form onSubmit={handleSubmit}>
                <h1 id="form-title">{formType}</h1>
                <label>
                    <textarea
                        id="note-text-area" 
                        type='text'
                        value={body}
                        onChange={(e) => setBody(e.target.value)}
                        placeholder="Share your notes with other cooks..."
                    />
                </label>
                <br/>
                <label id="your-name-text">Your Name
                <br/>
                    <textarea
                        id="your-name-text-area"
                        value={reviewerName}
                        onChange={(e) => setReviewerName(e.target.value)}
                        placeholder="Enter your name"
                    />
                    
                </label>
                <br/>
                <div id="add-note-button-container">
                    <button id="add-note-submit-button">Submit</button>
                </div>
            </form>
        )
    } else {
        return (
            <form onSubmit={handleSubmit}>
                <h1 id="edit-form-title">{formType}</h1>
                <label>
                    <textarea
                        id="edit-note-text-area" 
                        type='text'
                        value={body}
                        onChange={(e) => setBody(e.target.value)}
                    />
                </label>
                <br/>
                <label id="edit-your-name-text">Your Name
                <br/>
                    <textarea
                        id="edit-your-name-text-area"
                        value={reviewerName}
                        onChange={(e) => setReviewerName(e.target.value)}
                    />
                </label>
                <br/>
                <button>{formType}</button>
            </form>
        )
    }

}

