const fruits = require('./data.js');

const index = () => {
    for (let fruit of fruits) {
        console.log(fruit);
    }
}

const insert = (fruit) => {
    fruits.push(fruit);
}

module.exports = {index, insert};