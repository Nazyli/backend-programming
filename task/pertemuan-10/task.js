/**
 * Fungsi untuk menampilkan hasil download
 * @param {string} result - Nama file yang didownload
 */

const showDownload = (result) => {
    return new Promise((success, error) => {
        const status = true;
        status ? success(`Download selesai\nHasil Download: ${result}`) : error(`Download Gagal`);
    })
}

/**
 * Fungsi untuk download file
 * @param {function} callback - Function callback show
 */

const download = function (callShowDownload) {
    return setTimeout(function () {
        const result = `windows-10.exe`;
        callShowDownload(result).then((res) => {
            console.log(res);
        }).catch((err) => {
            console.log(err);
        });
    }, 3000);
}


download(showDownload);

/**
 * TODO:
 * - Refactor callback ke Promise atau Async Await
 * - Refactor function ke ES6 Arrow Function
 * - Refactor string ke ES6 Template Literals
 */