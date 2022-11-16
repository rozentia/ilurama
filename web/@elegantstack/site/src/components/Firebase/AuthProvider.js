import React, { createContext, useContext, useEffect, useState  } from "react";
import { auth } from "./Firebase";
import { onAuthStateChanged } from "firebase/auth";

const defaultContext = {
  currentUser: null,
}

export const AuthContext = createContext(defaultContext);
export const useAuth = () => useContext(AuthContext);

const AuthProvider = ({ children }) => {

  const [currentUser, setCurrentUser] = useState(null);

  useEffect(() => {
    onAuthStateChanged(auth, (user) => {
      setCurrentUser(user);
    });
  }, []);


  return (
    <AuthContext.Provider value={{currentUser, setCurrentUser}}>
      {children}
    </AuthContext.Provider>
  );
};

export function useAuthValue(){
  return useContext(AuthContext)
}

export default AuthProvider;