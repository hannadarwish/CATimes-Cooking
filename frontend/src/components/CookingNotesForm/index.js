
import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { getNote, fetchNote, createNote, updateNote } from '../../store/notes';
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
    const [reviewerName, setReviewerName] = useState(note.reviewer_name);

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

        return (
            <form onSubmit={handleSubmit}>
                <h1 id="form-title">{formType}</h1>
                <label>
                    <textarea id="note-text-area" 
                        type='text'
                        value={body}
                        onChange={(e) => setBody(e.target.value)}
                    />
                </label>
                <br/>
                <label>Your Name
                    <input 
                        value={reviewerName}
                        onChange={(e) => setReviewerName(e.target.value)}
                    />
                </label>
                <button>{formType}</button>
            </form>
        )

}

