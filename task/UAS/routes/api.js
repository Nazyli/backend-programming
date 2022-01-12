// TODO 2: SETUP ROUTING (ROUTER)
const express = require('express');
const router = express.Router();
const statusController = require("../Controllers/StatusController.js");
const patientsController = require("../Controllers/PatientsController.js");
const usersController = require("../Controllers/UsersController");
const { body, validationResult } = require('express-validator');



router.get('/', (req, res) => {
    res.send("UAS - Evry Nazyli Ciptanto - 0110220045 - Pemrograman Backend");
});

// Route Register & Login User
router.post('/register', [
    body('name').notEmpty().withMessage('name is required'),
    body('password').notEmpty().withMessage('password is required'),
    body('email').notEmpty().withMessage('email is required').isEmail().withMessage('Invalid email address')],
    [usersController.checkDuplicateEmail], usersController.register);
router.post('/login', [
    body('email').notEmpty().withMessage('email is required').isEmail().withMessage('Invalid email address'),
    body('password').notEmpty().withMessage('password is required')],
    usersController.login);

// Route StatusController
router.get('/status', [usersController.verifyToken], statusController.index);

// Route PatientsController
router.get('/patients', [usersController.verifyToken], patientsController.index);
router.post('/patients',
    [
        body('name').notEmpty().withMessage('name is required'),
        body('phone').notEmpty().withMessage('phone is required'),
        body('address').notEmpty().withMessage('address is required'),
        body('status_id').notEmpty().withMessage('status_id is required'),
        body('in_date_at').notEmpty().withMessage('in_date_at is required').isDate().withMessage('in_date_at format YYYY-MM-DD')
    ], [usersController.verifyToken], patientsController.store);
router.put('/patients/:id',
    [
        body('in_date_at').optional().isDate().withMessage('in_date_at format YYYY-MM-DD'),
        body('out_date_at').notEmpty().isDate().withMessage('out_date_at format YYYY-MM-DD')
    ], [usersController.verifyToken], patientsController.update);
router.delete('/patients/:id', [usersController.verifyToken], patientsController.destroy);
router.get('/patients/:id', [usersController.verifyToken], patientsController.show);
router.get('/patients/search/:name', [usersController.verifyToken], patientsController.index);
router.get('/patients/status/positive', [usersController.verifyToken], patientsController.positive);
router.get('/patients/status/recovered', [usersController.verifyToken], patientsController.recovered);
router.get('/patients/status/dead', [usersController.verifyToken], patientsController.dead);




// export
module.exports = router;