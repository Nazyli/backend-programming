// Call BACK

// function formatName(name) {
//     const result = name.toUpperCase();
//     return result;
// }

// function getName(name, callFormatName){
//     console.log(callFormatName(name));

// }
// getName("Evry", formatName);


// 
console.log("satu");

setTimeout(function () {
    console.log("dua");
}, 2000);

console.log("tiga");


const download = () => {
    return new Promise((success, error) => {
        const status = true;
        status ? success("berhasil") : error("yah, gagal");
    })
}

console.log(download());
download().then((result) => {
    console.log(result);
}).catch((err) => {
    console.log(err);
});
