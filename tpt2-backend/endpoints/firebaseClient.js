const firebaseAuth = require('firebase/auth');

const firebaseConfig = {
apiKey: "AIzaSyBUMTlABXPfyBbVYbB5xhsORaylzdt4MXY",
authDomain: "tpt-2-45eff.firebaseapp.com",
projectId: "tpt-2-45eff",
storageBucket: "tpt-2-45eff.appspot.com",
messagingSenderId: "629030371868",
appId: "1:629030371868:web:614fce6c9a3d77d3e315d9",
measurementId: "G-DFRV28HHMP"
};

module.exports.auth = firebaseAuth.getAuth(firebaseConfig)