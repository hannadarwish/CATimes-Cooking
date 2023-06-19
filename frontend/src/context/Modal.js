import React, { useContext, useRef, useState, useEffect } from 'react';
import ReactDOM from 'react-dom';
import './Modal.css';

const ModalContext = React.createContext();

export function ModalProvider({ children }) {
    const modalRef = useRef();
    const [value, setValue] = useState();

    useEffect(() => {
        setValue(modalRef.current);
    }, [])

    return (
        <>
            <ModalContext.Provider value={value}>
                {children}
            </ModalContext.Provider>
        <div ref={modalRef} />
        </>
    );
}

export function Modal({ onClose, children }) {
    const modalNode = useContext(ModalContext);
    if (!modalNode) return null;

    return ReactDOM.createPortal(
        <div id="login-modal">
            <div id="modal-background" onClick={onClose} />
            <div id="modal-content">
            <div class="login-picture-container">
                <span class="login-img-blurb">
                Unlock Chew Fork Times recipes and your personal recipe box with a free account.
                </span>
            </div>
            {children}
            </div>
        </div>,
        modalNode
    );
}

export function SignupModal({ onClose, children }) {
    const modalNode = useContext(ModalContext);
    if (!modalNode) return null;
  
    return ReactDOM.createPortal(
      <div id="signup-modal">
        <div id="modal-background" onClick={onClose} />
        <div id="modal-content">
          <div className="signup-picture-container">
            <span className="signup-img-blurb">
              Unlock Chew Fork Times recipes and your personal recipe box with a free account.
            </span>
          </div>
          {children}
        </div>
      </div>,
      modalNode
    );
  }
