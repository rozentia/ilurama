import * as functions from "firebase-functions";

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
export const verifyemail = functions
    .region("europe-west3")
    .https
    .onRequest((request, response) => {
      functions.logger.info(request.body, {structuredData: true});
      response.send(`<!doctype html>
      <head>
        <title>Time</title>
      </head>
      <body>
        Email Verified
      </body>
    </html>`);
    });
