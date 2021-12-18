class StudentsController {
    index(req, res) {
        const data = {
            "message" : "Halaman Students",
            "data" : []
        }
        res.json(data);
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