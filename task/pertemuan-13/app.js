const express = require('express');
const router = require('./routes/api');

const app = express();

const port = 3000;
app.listen(port, () => {
    console.log(`Server started on port ${port}`);
});
app.use(express.json());
app.use(router);
