const mysql = require('mysql');
const db = mysql.createConnection(
    {
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'express_student'
    }
);

db.connect((err) => {
    if (err) {
        console.log(`DB Connection is failed, error ${err.strack}`);
        return
    } else {
        console.log(`DB Connection success`);
        return
    }
});

module.exports = db;