import * as functions from "firebase-functions";
import * as auth from "./auth";
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
const helloWorld = functions
    .region("europe-west3")
    .https
    .onRequest((request, response) => {
      functions.logger.info("Hello logs!", {structuredData: true});
      response.send("Hello from Firebase!");
    });

export {helloWorld, auth};
