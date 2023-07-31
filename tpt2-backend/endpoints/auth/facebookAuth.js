const express = require('express');
const serverless = require("serverless-http");
const app = express();

const firebase =  require("firebase/auth");
const firebaseClient = require('../firebaseClient')

const provider = firebase.FacebookAuthProvider();
const auth = firebaseClient.auth;

provider.setCustomParameters({
    'display': 'popup',
})

app.post('/facebook_signin', (req, res) => {
    signInWithPopup(auth, provider)
    .then((result)=>{
        res.json({
            result
        })
    })
    .catch((error) => {
    const errorCode = error.code;
    const errorMessage = error.message;
    
    const email = error.customData.email;
    
    const credential = FacebookAuthProvider.credentialFromError(error);

    res.json({errorCode, errorMessage})
    });
})

module.exports.signIn = serverless(app);