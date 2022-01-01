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

    async find(req, res) {

        const id = req.params.id;
        const student = await Student.find(id);
        const response = {
            "message": "Find student ID : " + id,
            "data": student

        };
        res.status(200).json(response);
    }

    async store(req, res) {
        /**
         * TODO 2: memanggil method create.
         * Method create mengembalikan data yang baru diinsert.
         * Mengembalikan response dalam bentuk json.
         */
        // code here
        const { name, nim, prodi, address } = req.body;

        const insert = await Student.create(
            { name, nim, prodi, address }
        );
        const student = await Student.find(insert.insertId);

        const response = {
            message: "Menambahkan data student",
            data: student,
        };

        res.json(response);
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