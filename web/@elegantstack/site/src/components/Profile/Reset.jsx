import React, { useState } from 'react';
import { Link, navigate } from 'gatsby';
import { auth } from '../Firebase/Firebase';
import { sendPasswordResetEmail } from 'firebase/auth';

const Reset = () => {
  const [email, setEmail] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await sendPasswordResetEmail(auth, email);
      navigate(`/profile/login`);
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <div>
      <h1>Forgot Password</h1>
      <div className='login'>
        <div className='login__container'>
          {error && <div className='auth__error'>{error}</div>}
          <form onSubmit={handleSubmit}>
            <input
              type='email'
              name='email'
              value={email}
              required
              onChange={(e) => setEmail(e.target.value)}
              placeholder='E-mail Address'
            />
            <button>Forgot Password</button>
          </form>
          <div>
            Already have an account? <Link to='/profile/login'>Login</Link> now.
          </div>
          <div>
            Don't have an account? <Link to='/profile/register'>Register</Link> now.
          </div>
        </div>
      </div>
    </div>
  );
};

export default Reset;