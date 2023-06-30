import React from 'react';
import { NavLink } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import LoginFormModal from '../LoginFormModal';
import './Navigation.css';
import SignupFormModal from '../SignupFormModal';
import RecipeBoxButton from './RecipeBoxButton';

function Navigation() {
    const sessionUser = useSelector(state => state.session.user);

    let sessionLinks;
    if (sessionUser) {
        sessionLinks = (
            <>
                <RecipeBoxButton />
                <ProfileButton user={sessionUser} />
            </>
        );
    } else {
        sessionLinks = (
            <>
                <LoginFormModal />
                <SignupFormModal />
            </>
        );
    }

    return (
        <ul className="nav">
            <div className="cyt-site-logo-container">
                <NavLink exact to="/">
                    <div id="cyt-site-logo"></div>
                </NavLink>
            </div>
            <li className="nav-buttons">
                {/* <NavLink className ="easy-weeknight-dinners-nav"exact to="/easyweeknightdinners">Easy Weeknight Dinners</NavLink> */}
                {sessionLinks}
            </li>
        </ul>
    );
}

export default Navigation;