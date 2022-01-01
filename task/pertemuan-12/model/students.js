const db = require("../config/database")

class Students {
    static all() {
        return new Promise((resolve, reject) => {
            const query = "SELECT * FROM students";

            db.query(query, (err, results) => {
                resolve(results);
            });
        });
    }

    static find(id) {
        return new Promise((resolve, reject) => {
            const query = "SELECT * FROM students WHERE id = ?";

            db.query(query, [id], (err, results) => {
                err ? reject(err) : resolve(results);
            });
        });
    }

    /**
   * TODO 1: Buat fungsi untuk insert data.
   * Method menerima parameter data yang akan diinsert.
   * Method mengembalikan data student yang baru diinsert.
   */
    static create(data) {
        return new Promise((resolve, reject) => {
            const query = "INSERT INTO students SET ?;";

            db.query(query, data, (err, results) => {
                err ? reject(err) : resolve(results);
            });
        });
    }

}

module.exports = Students;