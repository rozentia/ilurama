import React from "react"
import { Link, navigate } from "@reach/router"
import { useAuthValue } from "./AuthProvider";
import { signOut } from "firebase/auth";
import { auth } from "./Firebase";

export default () => {

  const { currentUser } = useAuthValue();

  let details
  if (!currentUser) {
    details = (
      <p>
        To get the full app experience, you'll need to
        {` `}
        <Link to="/profile/login">log in</Link>.
      </p>
    )
  } else {
    details = (
      <p>
        Logged in as {currentUser.email}
        {` `}
        <a
          href="/"
          onClick={event => {
            event.preventDefault()
            signOut(auth)
            navigate(`/profile/login`)
          }}
        >
          log out
        </a>
      </p>
    )
  }

  return <div>{details}</div>
}