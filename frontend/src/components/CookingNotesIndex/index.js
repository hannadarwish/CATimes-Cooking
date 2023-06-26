import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import CookingNote from "../CookingNote";
import { getNotes, fetchNotes } from "../../store/notes";
import './CookingNotesIndex.css'

export default function CookingNotesIndex({recipeId }) {
    const notes = useSelector(getNotes);
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchNotes(recipeId));
    }, [dispatch, recipeId]);


    return (
        <div className="cooking-notes-index-container">
            <ul className="notes-index-ul">
                HELLO FROM NOTES INDEX
                {notes.map(note => (
                    <CookingNote note={note} key={note.id} /> //key is optional
                ))}
            </ul>
        </div>
    )
}