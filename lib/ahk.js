const execute = require('child_process').exec
const path = require('path')

function exec(filename) {
    return promise = new Promise((resolve, reject) => {
        execute(`cd ${process.env.AHK_PATH}& AutoHotKeyU64.exe "${path.join(__dirname, `../scripts/${filename}`)}"`, (err, data) => {
            if(err) reject(err)
            else resolve()
        })
    })
}


module.exports.exec = exec