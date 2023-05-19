const { initializeApp, applicationDefault, cert } = require('firebase-admin/app');
const { getFirestore, Timestamp, FieldValue } = require('firebase-admin/firestore');
const serviceAccount = require('./takeaway-3fa55-firebase-adminsdk-i89nk-8bb632da37.json');

initializeApp({
  credential: cert(serviceAccount)
});

const db = getFirestore();

const docRef = db.collection('users').doc('alovelace');

//Add data
docRef.set({
  first: 'Ada',
  last: 'Lovelace',
  born: 1815
});

//Read data