const db = require("../config/database")

class Students {
    static all() {
        const sql = "SELECT * FROM students";

        return this.query(sql, null, (result) => result);
    }

    static find(id) {
        const sql = "SELECT * FROM students WHERE id = ?";

        return this.query(sql, id, (result) => result);
    }

    static async create(data) {
        const sql = "INSERT INTO students SET ?";
        const id  = await this.query(sql, data, (result) => result.insertId);

        return this.find(id);

    }

    static async update(id, data) {
        const sql = `UPDATE students SET ? WHERE id = ?`;
        await this.query(sql, [data, id], (result) => result);

        return this.find(id);
    }

    static delete(id) {
        const sql = "DELETE FROM students WHERE id =  ?";
        return this.query(sql, id, (result) => result);
    }

    static query(sql, body, callback) {
        return new Promise((resolve, reject) => {
            db.query(sql, body, (err, results) => {
                resolve(callback(results));
                // err ? reject(err) : resolve(results);
            });
        });
    }

}

module.exports = Students;