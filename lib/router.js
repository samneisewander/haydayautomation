const path = require('path')
const router = require('express').Router()
const ahk = require('./ahk.js')
require('dotenv').config()

//GET Routes
router.get('/', (req, res) => {
    if (debug) console.log('get/market')
    res.sendFile(path.join(__dirname, './pages/home.html'))
})


module.exports = router