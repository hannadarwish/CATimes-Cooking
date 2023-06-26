import React from "react";
import { deleteNote } from "../../store/notes";
import { useDispatch } from "react-redux";
import CookingNotesForm from "../CookingNotesForm";
import { useState } from "react";
import './CookingNote.css'

export default function CookingNote({note}) {
    const dispatch = useDispatch();

    const [showForm, setShowForm] = useState(false)

    const handleEdit = (e) => {
        setShowForm(true)
    }

    return (
        <div id="cooking-note-container">
            <span id="note-reviewer-name">{note.reviewerName}</span>
            <p id="note-body-text">{note.body}</p>
            <div id="note-buttons-container">
                <button className="note-edit-delete-buttons" onClick={handleEdit} >Edit</button>
                <button className="note-edit-delete-buttons" onClick={() => dispatch(deleteNote(note.id))}>Delete</button>
            </div>
            {showForm ?  <CookingNotesForm recipeId={note.recipeId} formType={"Edit Note"} note={note} setShowForm={setShowForm} />  : null }
        </div>
    )
}