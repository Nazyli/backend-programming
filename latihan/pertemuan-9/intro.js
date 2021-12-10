

const age = 22;
const name = "Evry Nazyli Ciptanto";

console.log("Nama saya " + name + " Berumur " + age);
console.log(`Nama saya ${name} Berumur ${age}`);

console.log(typeof age);
console.log(typeof name);

if (age >= 20) {
    console.log("Sudah Berumur");
} else {
    console.log("Masih muda");
}

console.log(age >= 20 ? "Sudah Berumur" : "Masih Muda");

for (let i = 1; i <= 10; i++) {
    console.log(i);
}


// command function
function calcAreaOfCircle(radius) {
    const phi = 3.14;
    return phi * radius * radius;
}

// Arrow function
const calcAreaOfCircleArrow = function (radius) {
    const phi = 3.14;
    return phi * radius * radius;
}

// lamba
const calcAreaOfCircleLambda1 = (radius) => {
    const phi = 3.14;
    return phi * radius * radius;
}

const calcAreaOfCircleLambda2 = (radius) => 3.14 * radius * radius;

const fruits = ["Banana", "Melon", "Watermelon"];

for (let fruit of fruits) {
    console.log(fruit);
}

const user = {
    fullname: "evry nazyli",
    age: 22,
    address: "Magetan"
};

// destructing
const { fullname, address } = user;
console.log(fullname);
console.log(address);


