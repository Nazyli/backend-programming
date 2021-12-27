const db = require("../config/database")

class Students {
    static all(callback) {
        return new Promise((resolve, reject) => {
            const query = "SELECT * FROM students";

            db.query(query, (err, results) => {
                resolve(results);
            });
        });
    }
}

module.exports = Students;