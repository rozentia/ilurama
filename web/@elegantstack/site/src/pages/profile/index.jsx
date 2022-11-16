import React from 'react'
import { Router } from '@reach/router'
import Login from '../../components/Profile/Login'
import PrivateRoute from '../../components/Profile/PrivateRoute'
import Profile from '../../components/Profile/Profile'
import Status from '../../components/Firebase/Status'
import Register from '../../components/Profile/Register'
import Reset from '../../components/Profile/Reset'



const ProfileRouter = () => (
  <>
    <Status />
    <Router>
      <PrivateRoute path='/profile/me' component={Profile} />
      <Login path='/profile/login' />
      <Register path='/profile/register' />
      <Reset path='/profile/reset' />
    </Router>
  </>
)



export default ProfileRouter