//Modules
require('dotenv').config()
const express = require('express')
const ahk = require('./lib/ahk.js')
const path = require('path')
const { createWorker } = require('tesseract.js');
const sharp = require('sharp')
const screenshot = require('screenshot-desktop')

//Init Application
const app = require('express')()

//Middleware
app.use(express.urlencoded({ extended: true }))
app.use(express.json())
app.use('/lib', express.static('lib'))
app.use('/scripts', express.static('scripts'))
app.use('/pages', express.static('pages'))
app.use('/assets', express.static('assets'))

//Routes
const routes = require('./lib/router.js')
app.use(routes)

//Initialize Hay Day Instance / Run some automations
async function initialize() {
    await ahk.exec("LnchHDalt2.ahk") // Launch Hay Day
        .then(() => {
            console.log(`Initialized at ${new Date(Date.now()).toTimeString()}`)
        })
        .catch((err) => {
            console.warn(err)
        })
    await ahk.exec("StandardizeCamera.ahk") // Set the game's camera to a standard position.
        .then(() => {
            console.log(`Initialized at ${new Date(Date.now()).toTimeString()}`)
        })
        .catch((err) => {
            console.warn(err)
        })
}

async function farmWheat() {
    //let lvl = await checkLvl()
    await ahk.exec("PlantWheat.ahk") // Harvest and plant wheat crops
        .then(() => {
            console.log(`Wheat planted at ${new Date(Date.now()).toTimeString()}`)
        })
        .catch((err) => {
            console.warn(err)
        })
    // if(await checkLvl() != lvl) {
    //     initialize().then(farmWheat)
    //     return
    // }

    await ahk.exec("SellStockpile.ahk")
        .then(() => {
            console.log('Stockpile put on sale.')
        })
        .catch((err) => {
            console.warn(err)
        })

}

// async function checkLvl() {
//     let imgPath = './assets/screenshot.jpg'
//     let cropPath = './assets/cropped.jpg'
//     await ahk.exec('FocusHayDay.ahk')
//     await screenshot({ filename: imgPath })
//         .then(() => {
//             console.log('Screenshot taken.')
//         })
//         .catch((err) => {
//             console.warn(err)
//             return
//         })
//     await sharp(imgPath)
//         .extract({ left: 375, top: 35, width: 25, height: 35 })
//         .toFile(cropPath)
//         .then(info => {
//             console.log('Image cropped.')
//         })
//         .catch(err => {
//             console.warn(err)
//             return
//         })
//     let tesseract = await createWorker()
//     await tesseract.loadLanguage('eng')
//     await tesseract.initialize('eng')
//     await tesseract.setParameters({ tessedit_char_whitelist: "1234567890" })
//     let { data: { text } } = await tesseract.recognize(cropPath)
//     console.log('Level read as ' + text)
//     await tesseract.terminate();
//     return text
// }
// async function test() {
//     await ahk.exec("Test.ahk")
// }

async function reloadFarmLoop() {
    // Initializes and farms repeatedly on an interval. See below comment
    await ahk.exec('FocusHayDay.ahk')
    await farmWheat()
    setTimeout(reloadFarmLoop, 1000 * 60 * 2 /*2 minutes*/)
    await ahk.exec('RelaunchApp.ahk')
        .then(() => {
            console.log(`App relaunched at ${new Date(Date.now()).toTimeString()}`)
        })
        .catch((err) => {
            console.warn(err)
        })
    await ahk.exec("StandardizeCamera.ahk")
        // Set the game's camera to a standard position.
        .then(() => {
            console.log(`Camera positioned at ${new Date(Date.now()).toTimeString()}`)
        })
        .catch((err) => {
            console.warn(err)
        })
}

initialize().then(reloadFarmLoop)


//Listen
app.listen(3000)
console.log(`Listening on port 3000 at ${new Date(Date.now()).toTimeString()}`)