const express = require('express');

const router = express.Router();

const studentController = require("../Controllers/StudentsController");
router.get('/', (req, res) => {
    res.send("Halaman Home");
});

// router.get('/students', (req, res) => {
//     studentController.index(req,res);
// });


// Routing api students
// Import studentController
router.get('/students', studentController.index);
router.get('/students/:id', studentController.find);
router.post('/students', studentController.store);
router.put('/students/:id', studentController.update);
router.delete('/students/:id', studentController.destroy);

// export
module.exports = router;