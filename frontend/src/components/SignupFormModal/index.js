import React, { useState } from 'react';
import { SignupModal } from '../../context/SignupModal';
import SignupFormPage from './SignupFormPage';

function SignupFormModal() {
  const [showModal, setShowModal] = useState(false);

  return (
    <>
      <button id="subscribe-home-button" onClick={() => setShowModal(true)}>Subscribe</button>
      {showModal && (
        <SignupModal onClose={() => setShowModal(false)}>
          <SignupFormPage />
        </SignupModal>
      )}
    </>
  );
}

export default SignupFormModal;