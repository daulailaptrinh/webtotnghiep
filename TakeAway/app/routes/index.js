/**
 * Module routes dùng để điều hướng trang
 */
var express = require('express');
var router = express.Router();

var db = require('../../database');

/* Chuyển đến trang chủ */
router.get('/', function (req, res, next) {
    res.render('index', { title: 'Express', session: req.session });
});


/* Chuyển đến trang admin */
router.get('/admin', function (req, res, next) {
    res.render('admin', { title: 'Express', session: req.session });
});


/* Chuyển đến trang login */
router.get('/login', function (req, res, next) {
    res.render('login', { title: 'Express', session: req.session });
});

/**
 * Nhận dữ liệu email và password sau đó tiến hành kiểm tra
 */
router.post('/login', async function (request, response, next) {

    var user_email_address = request.body.user_email_address;

    var user_password = request.body.user_password;

    if (user_email_address && user_password) {
        const cityRef = db.collection('users').doc(user_email_address);
        const doc = await cityRef.get();
        if (!doc.exists) {
            console.log('Tài khoản không tồn tại!');
        } else {
            console.log('Document data:', doc.data());
            if (doc.data().MatKhau == user_password)
            {
                request.session.user_id = doc.data().ID;
                if (doc.data().Quyen == 'admin')
                {
                    response.redirect("/admin");
                }
                else
                {
                    response.redirect("/");
                }
            }
        }

    }
    else {
        response.send('Please Enter Email Address and Password Details');
        response.end();
    }

});

router.get('/logout', function (request, response, next) {

    request.session.destroy();

    response.redirect("/");

});

module.exports = router;

