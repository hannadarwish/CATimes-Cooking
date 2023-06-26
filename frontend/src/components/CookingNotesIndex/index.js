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

    let numNotes = notes.length


    return (
        <div className="cooking-notes-index-container">
            <div id="all-notes-text-container">
                <h3 id="all-notes-text">All Notes <span id="num-notes">({numNotes})</span> </h3>
            </div>
            <ul className="notes-index-ul">
                {notes.map(note => (
                    <CookingNote note={note} key={note.id} /> //key is optional
                ))}
            </ul>
        </div>
    )
}