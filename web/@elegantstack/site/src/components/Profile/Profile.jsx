import React from 'react'

import { useAuthValue } from '../Firebase/AuthProvider';
import { signOut } from 'firebase/auth';
import { auth } from '../Firebase/Firebase';

const Profile = () => {
  const { currentUser } = useAuthValue();

  return (
    <div>
        <h1>Your Profile</h1>
      <p>Welcome back to your profile, {currentUser.email}!</p>
      <p>
        This is a client-only route. You could set up a form to save information
        about a user here.
      </p>
      <span
        role='button'
        tabIndex={0}
        onClick={() => signOut(auth)}
        onKeyUp={console.log('unimplemented')}
        >Sign Out</span>
    </div>
  )
}

export default Profile