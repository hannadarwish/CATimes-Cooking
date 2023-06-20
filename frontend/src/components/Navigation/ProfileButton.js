import { FaUser } from 'react-icons/fa';
import React, { useState, useEffect } from "react";
import { useDispatch } from 'react-redux';
import * as sessionActions from '../../store/session';
import { ProfileSideBarModal } from '../../context/Modal';

function ProfileButton({ user }) {
    const dispatch = useDispatch();
    const [showModal, setShowModal] = useState(false);
    
    const openModal = () => {
        setShowModal(true);
    };
    
    const closeModal = () => {
        setShowModal(false);
    }

    useEffect(() => {
        if (!showModal) return;

        document.addEventListener('click', closeModal);
    
        return () => document.removeEventListener("click", closeModal);
    }, [showModal]);

    const logout = (e) => {
        e.preventDefault();
        dispatch(sessionActions.logout());
    };

    return (
        <>
            <button id="profile-button" onClick={openModal}>
                <FaUser />
            </button>
            {showModal && (
                <ProfileSideBarModal onClose={closeModal}>
                    <ul className= "profile-sidebar-modal" >
                        <div className="profile-sidebar">
                            <button id="profile-modal-close-button" onClick={closeModal}>Close</button>
                            <div id="user-email-container">
                                <h2 id="user-email"> {user.email}</h2>
                            </div>
                            <div id="greeting-container">
                                <h1 id="good-afternoon-text">Good afternoon.</h1>
                            </div>
                            <h1 id="your-subscription">YOUR SUBSCRIPTION</h1>
                            <div id="all-access-container">
                                <span id="all-access">All Access</span>
                            </div>
                            <br/>
                            <button id="profile-modal-logout-button" onClick={logout}>Log out</button>
                        </div>
                    </ul>
                </ProfileSideBarModal>
            )}
        </>
    );
}

export default ProfileButton;