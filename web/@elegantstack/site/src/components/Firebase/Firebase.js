import { initializeApp } from 'firebase/app'
import {
  getAuth,
  onAuthStateChanged,
} from 'firebase/auth'
import {
  getFunctions,
} from 'firebase/functions'
import {
  initializeAppCheck,
  ReCaptchaV3Provider,
} from 'firebase/app-check'

const firebaseConfig = {
  apiKey: process.env.GATSBY_FIREBASE_API_KEY,
  authDomain: process.env.GATSBY_FIREBASE_AUTH_DOMAIN,
  databaseURL: process.env.GATSBY_FIREBASE_DATABASE_URL,
  projectId: process.env.GATSBY_FIREBASE_PROJECT_ID,
  storageBucket: process.env.GATSBY_FIREBASE_STORAGE_BUCKET,
  messagingSenderId: process.env.GATSBY_FIREBASE_MESSAGING_SENDER_ID,
  appId: process.env.GATSBY_FIREBASE_APP_ID,
  measurementId: process.env.GATSBY_FIREBASE_MEASUREMENT_ID,
};

let app
let appCheck
let auth
let functions

if (typeof window !== 'undefined') {
  app = app || initializeApp(firebaseConfig)
  appCheck = initializeAppCheck(app, {
    provider: new ReCaptchaV3Provider(process.env.GATSBY_RECAPTCHA_SITE_KEY),
    isTokenAutoRefreshEnabled: true
  })
  auth = getAuth(app)
  functions = getFunctions(app)
}

export {
  auth,
  functions,
  onAuthStateChanged,
}