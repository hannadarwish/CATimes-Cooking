
import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { getNote, fetchNote, createNote, updateNote } from '../../store/notes';

export default function CookingNotesForm({recipeId}) {
    const { noteId } = useParams();
    const formType = noteId ? "Edit Note" : "Add Note";
    let note = useSelector(getNote(noteId));
    const dispatch = useDispatch();

    if (formType === "Add Note") {
        note = {
            body:"",
            reviewer_name: "",
        }
    }

    useEffect(() => {
        if (formType === "Edit Note") {
            dispatch(fetchNote(noteId))
        }
    }, [noteId])

    const [body, setBody] = useState(note.body);
    const [reviewerName, setReviewerName] = useState(note.reviewer_name); //reviewerName?

    const handleSubmit = (e) => {
        e.preventDefault();

        const newNote = {
            ...note,
            body: body,
            reviewer_name: reviewerName,
            recipe_id: recipeId
        }

        debugger

        if (formType === "Add Note") {
            dispatch(createNote(newNote))
        } else {
            dispatch(updateNote(newNote))
        }
    }

        return (
            <form onSubmit={handleSubmit}>
                <h1>{formType}</h1>
                <label>
                    <textarea 
                        type='text'
                        value={body}
                        onChange={(e) => setBody(e.target.value)}
                    />
                </label>
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