import React from 'react';
import { NavLink } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import LoginFormModal from '../LoginFormModal';
import './Navigation.css';

function Navigation() {
    const sessionUser = useSelector(state => state.session.user);

    let sessionLinks;
    if (sessionUser) {
        sessionLinks = (
            <ProfileButton user={sessionUser} />
        );
    } else {
        sessionLinks = (
            <>
                <LoginFormModal />
                <NavLink to="/signup" id="subscribe-button">Subscribe</NavLink>
            </>
        );
    }

    return (
        <ul class="nav">
            <div class="cyt-site-logo-container">
                <div id="cyt-site-logo"></div>
            </div>
            <div>

            </div>
            <li class="nav-buttons">
                {/* <NavLink exact to="/">Home</NavLink> */}
                {/* need to change EWD link */}
                <NavLink class ="easy-weeknight-dinners-nav"exact to="/">Easy Weeknight Dinners</NavLink>
                {sessionLinks}
            </li>
        </ul>
    );
}

export default Navigation;