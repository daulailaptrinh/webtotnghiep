const { initializeApp, applicationDefault, cert } = require('firebase-admin/app');
const { getFirestore, Timestamp, FieldValue } = require('firebase-admin/firestore');
const serviceAccount = require('./takeaway-3fa55-firebase-adminsdk-i89nk-8bb632da37.json');

initializeApp({
  credential: cert(serviceAccount)
});

class UserServices {
  constructor(client) {
    this.User = getFirestore().collection('users');
  }

  extractConactData(payload) {

    const user = {
      first: payload.name,
      last: payload.last,
      born: payload.born,
    };

    Object.keys(user).forEach(
      (key) => user[key] === undefined && delete user[key]
    );

    return user;
  }

  async find(filter) {
    const cursor = await this.User.find(filter);
    return await cursor.toArray();
  }

}

module.exports = UserServices;