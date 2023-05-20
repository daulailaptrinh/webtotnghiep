const { getFirestore, Timestamp, FieldValue} = require('firebase-admin/firestore');
// Create new user
exports.create = async (req, res, next) => {
    res.send({ message: "create user" });
};

// exports.findAll = async (req, res) => {
//     const userRef = db.collection('users').doc('Trung');
//     const doc = await userRef.get();
//     if (!doc.exists) {
//         console.log('No such document!');
//     } else {
//         console.log('Document data:', doc.data());
//         //res.json(doc.data());
//     }
//     return doc.data();
// };

exports.findAll = (req, res) => {
    res.send({ message: "findAll handler" });
};