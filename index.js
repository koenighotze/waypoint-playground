const express = require('express')
const path = require('path')
const PORT = process.env.PORT || 3000

const liveness = (_, res) => res.sendStatus(200)
const readiness = (_, res) => res.sendStatus(200)
const renderHome = (_, res) => res.render('pages/index')

express()
  .use(express.static(path.join(__dirname, 'public')))
  .set('views', path.join(__dirname, 'views'))
  .set('view engine', 'ejs')
  .get('/', renderHome)
  .get('/liveness', liveness)
  .get('/readiness', readiness)
  .listen(PORT, () => console.log(`Server running on port ${PORT}`))
