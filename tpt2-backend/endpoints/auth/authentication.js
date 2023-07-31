const express = require('express');
const admin = require('firebase-admin');

const router = express.Router();

// Initialize firebase admin
const serviceAccount = require('../../credentials/serviceAccountKey.json');
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
});

// Google Signin endpoint
router.post('/google-signin', async (req, res, next) => {
    const idToken = req.body.idToken;
    try {
        const decodedToken = admin.auth().verifyIdToken(idToken);
        const userUid = decodedToken.uid;
        const customToken = await admin.auth().createCustomToken(userUid);
        // user successfully signed in with Google
        res.json({ customToken });
    } catch (error) {
        next(error);
    }
});

module.exports = router;