//Modules
require('dotenv').config()
const express = require('express')
const ahk = require('./lib/ahk.js')
const path = require('path')


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
async function main() {
    await ahk.exec("LnchHDalt2.ahk") // Launch Hay Day
        .then(() => {
            console.log('Launched.')
        })
        .catch((err) => {
            console.warn(err)
        })
    await ahk.exec("StandardizeCamera.ahk") // Set the game's camera to a standard position.
        .then(() => {
            console.log('Camera Positioned.')
        })
        .catch((err) => {
            console.warn(err)
        })
    await ahk.exec("PlantCorn.ahk") // Harvest and plant corn crops
        .then(() => {
            console.log('Corn Planted.')
        })
        .catch((err) => {
            console.warn(err)
        }) 
}

main()

//Listen
app.listen(3000)
console.log('Listening on port 3000.')