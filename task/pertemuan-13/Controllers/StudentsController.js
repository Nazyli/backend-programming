const Student = require("../model/students.js");

class StudentsController {
    async index(req, res) {
        let response = {};

        const students = await Student.all();
        if (students.length > 0) {
            response = {
                message: "Get all students",
                data: students

            };
            return res.status(200).json(response);
        }

        response = { message: "Students is empty", data: [] };
        return res.status(200).json(response);
    }

    async find(req, res) {
        let response;
        const id = req.params.id;
        const student = await Student.find(id);

        if (student.length > 0) {
            response = {
                message: `Find student ID : ${id}`,
                data: student
            };
            return res.status(200).json(response);
        }
        response = { message: "Student data doesn't exist", data: null };
        return res.status(404).json(response);

    }

    async store(req, res) {
        let response = {};
        const { name, nim, prodi, address } = req.body;

        if (!name || !nim || !prodi || !address) {
            response = { message: "all data must be sent", data: null };
            return res.status(422).json(response);
        }

        const student = await Student.create(
            { name, nim, prodi, address }
        );

        response = {
            message: "store student data",
            data: student,
        };
        return res.status(201).json(response);
    }

    async update(req, res) {
        let response = {};
        const { id } = req.params;

        const { name, nim, prodi, address } = req.body;
        const student = await Student.find(id);
        if (student.length > 0) {
            const update = await Student.update(id,
                { name, nim, prodi, address }
            );
            response = {
                message: "Update data student",
                data: update,
            };
            return res.status(200).json(response);

        }

        response = { message: "Student data doesn't exist", data: null };
        return res.status(404).json(response);

    }

    async destroy(req, res) {
        let response = {};
        const { id } = req.params;

        const student = await Student.find(id);
        if (student.length > 0) {
            await Student.delete(id);
            response = {
                message: "Success delete student data",
                data: student,
            };
            return res.status(200).json(response);
        }

        response = { message: "Student data doesn't exist", data: null };
        return res.status(404).json(response);

    }
}
// object
const objectStudents = new StudentsController();

// export
module.exports = objectStudents;