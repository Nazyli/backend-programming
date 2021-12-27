const Student = require("../model/students.js");

class StudentsController {
    async index(req, res) {

        const students = await Student.all();
        const response = {
            "message": "Get all students",
            "data": students

        };
        res.status(200).json(response);
    }

    store(req, res) {
        res.send("Menambahkan data Students");
    }

    update(req, res) {
        const { id } = req.params;
        res.send(`Mengedit data Students ${id}`);
    }

    destroy(req, res) {
        const { id } = req.params;
        res.send(`Menghapus data Students ${id}`);
    }
}
// object
const objectStudents = new StudentsController();

// export
module.exports = objectStudents;