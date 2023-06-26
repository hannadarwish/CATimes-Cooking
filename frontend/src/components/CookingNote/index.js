import React from "react";
import { deleteNote } from "../../store/notes";
import { useDispatch } from "react-redux";
import CookingNotesForm from "../CookingNotesForm";
import { useState } from "react";

export default function CookingNote({note}) {
    const dispatch = useDispatch();

    const [showForm, setShowForm] = useState(false)

    const handleEdit = (e) => {
        setShowForm(true)
    }

    return (
    
        <div className="cooking-note-container">
            <p>{note.body}</p>
            <span>{note.reviewerName}</span>
            <button onClick={handleEdit} >Edit</button>
            <button onClick={() => dispatch(deleteNote(note.id))}>Delete</button>
            {showForm ?  <CookingNotesForm recipeId={note.recipeId} formType={"Edit Note"} note={note} setShowForm={setShowForm} />  : null }
        </div>

    )
}