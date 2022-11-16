import React, { useState } from 'react';
import { Link, navigate } from 'gatsby';
import { auth } from '../Firebase/Firebase';
import { signInWithEmailAndPassword } from 'firebase/auth';

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await signInWithEmailAndPassword(auth, email, password);
      navigate(`/app/profile`);
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <div>
      <h1>Log In</h1>
      <div className='login'>
        <div className='login__container'>
          {error && <div className='auth__error'>{error}</div>}
          <form onSubmit={handleSubmit}>
            <input
              type='email'
              name='email'
              required
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder='E-mail Address'
            />
            <input
              type='password'
              name='password'
              required
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder='Password'
            />
            <button>Login</button>
          </form>
          <div>
            <Link to='/app/reset'>Forgot Password</Link>
          </div>
          <div>
            Don't have an account? <Link to='/app/register'>Register</Link> now.
          </div>
        </div>
      </div>
    </div>
  );
};

export default Login;