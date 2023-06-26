import React from "react";
import { deleteNote } from "../../store/notes";
import { useDispatch } from "react-redux";

export default function CookingNote({note}) {
    const dispatch = useDispatch();

    return (
        <div className="cooking-note-container">
            <p>{note.body}</p>
            <span>{note.reviewerName}</span>
            {/* <button onClick={ switchToEditForm }>Edit</button> */}
            <button onClick={() => dispatch(deleteNote(note.id))}>Delete</button>
        </div>
    )
}