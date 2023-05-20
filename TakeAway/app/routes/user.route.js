const express = require("express");
const users = require("../controllers/user.controller")

const router = express.Router();;

router.route("/")
    .post(users.create)
    .get(users.findAll)

module.exports = router;