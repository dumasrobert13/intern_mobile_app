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
    const { idToken } = req.body.idToken;
    try {
        const decodedToken = admin.auth().verifyIdToken(idToken);
        const userUid = decodedToken.uid;
        const customToken = await admin.auth().createCustomToken(userUid);
        // user successfully signed in with Google
        res.json({ customToken });
    } catch (error) {
        res.status(401).json({ error: 'Failed to sign in with Google' });
        next(error);
    }
});

// Facebook authentication endpoint
router.post('/facebook-signin', async (req, res, next) => {
    const { accessToken } = req.body;
    try {
        const facebookCredential = admin.auth.FacebookAuthProvider.credential(accessToken);
        const result = await admin.auth().signInWithCredential(facebookCredential);
        // User successfully authenticated with Facebook
        const { uid, email } = result.user;
        res.json({ uid, email });
    } catch (error) {
        res.status(401).json({ error: 'Failed to authenticate with Facebook' });
        next(error);
    }
});

// Register with email and password endpoint
router.post('/register', async (req, res, next) => {
    const { email, password } = req.body;
    try {
        const user = await admin.auth().createUser({ email, password });
        // User successfully registered
        res.json({ message: 'User registered successfully', uid: user.uid });
    } catch (error) {
        res.status(401).json({ error: 'Failed to authenticate' });
        next(error);
    }
});

module.exports = router;