
import React, { useState } from 'react';
import * as sessionActions from '../../store/session';
import { useDispatch } from 'react-redux';
import './LoginForm.css';

function LoginForm() {
    //dispatch allows you to dispatch actions to store and trigger state updates
    //use it in conjunction with action creators to dispatch actions.
    const dispatch = useDispatch(); 
    // select the "user" property from the "session" slice of state.
    //useSelector subscribes the component to the selected state value
    // by using sessionUser variable, the component can check if a user is currently logged in (sessionUser is truthy)
    // const sessionUser = useSelector(state => state.session.user);
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [errors, setErrors] = useState([]);

    // if (sessionUser) return <Redirect to="/" />;

    const handleSubmit = (e) => {
        // prevent default to prevent reloading page when submitting
        e.preventDefault();
        // clear any previous errors
        setErrors([]);
        // dispatches the login action, triggers the login process (in session.js) and sends the email and password values as parameters
        // inside session.js, in the thunk login function, if the login request is successful, it dispatches "setCurrentUser" action with the user data received from server
        return dispatch(sessionActions.login({ email, password }))

        // .catch((error) => {
        //     // console.log('Error:', error);
        //     // console.log(error.message)
        //     setErrors([error.statusText]);
        // });
            // if there is an error in login, the .catch block is run
            .catch(async (res) => {
                let data;
                try {
                    // .clone() essentially allows you to read the response body twice
                    data = await res.clone().json();
                } catch {
                    data = await res.text(); // Will hit this case if the server is down
                }
                // if there are data.errors, it means the server responded with a specific error message.
                // so it sets the errors state to "data.errors" by using "setErrors(data.errors)"
                if (data?.errors) setErrors(data.errors);
                // if there is no data, an unexpected response was received so it sets errors state to "[res.statusText]"
                else if (data) setErrors([data]);
                else setErrors([res.statusText]);
            });
    }

    return (
        // when form is submitted, the component re-renders, displaying any error messages in the <ul> element using errors.map
        <div class="form-container">
            <form class="login-form" onSubmit={handleSubmit}>
                <ul>
                    {errors.map(error => <li key={error}>{error}</li>)}
                </ul>
                <h2 id="login-modal-text">Log in to CFT Cooking</h2>
                <label id="email">
                    <span id="email-text">Email Address</span>
                    <br/>
                    <input
                        type="text"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        required
                    />
                </label>
                <br/>
                <label id="password">
                    <span id="password-text">Password</span>
                    <br/>
                    <input
                        type="password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        required
                    />
                </label>
                <br/>
                <button id="login-modal-button" type="submit">Log In</button>
            </form>
        </div>
    );
}

export default LoginForm;