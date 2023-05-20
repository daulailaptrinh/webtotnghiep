const express = require("express");
const cors = require("cors");
const usersRouter = require("./app/routes/user.route");
const { initializeApp, applicationDefault, cert } = require('firebase-admin/app');
const { getFirestore, Timestamp, FieldValue } = require('firebase-admin/firestore');
const serviceAccount = require('./app/utils/takeaway-3fa55-firebase-adminsdk-i89nk-8bb632da37.json');

initializeApp({
    credential: cert(serviceAccount)
});

const db = getFirestore();

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", async (req, res) => {
    // res.json({message: "Hello World!"});
    const userRef = db.collection('users').doc('Trung');
    const doc = await userRef.get();
    if (!doc.exists) {
        console.log('No such document!');
    } else {
        console.log('Document data:', doc.data());
        res.json(doc.data());
    }
});

app.get("/add", async (req, res) => {
    const docRef = db.collection('users').doc('Trung3');
    docRef.set({
        first: 'Dang',
        last: 'Trung3',
        born: 2001
    });
});

// app.use("/api/users", usersRouter);

// app.get("/", (req, res) => {
//     res.json({message: "Welcome to contact book application!"});
// });
module.exports = app;