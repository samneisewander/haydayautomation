const path = require('path')
const router = require('express').Router()

//GET Routes
router.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, './pages/home.html'))
})

//POST Routes

module.exports = router