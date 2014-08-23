express = require('express')
app = express()

browserify = require('browserify-middleware')
coffeeify = require('coffeeify')

browserify.settings('extensions', ['.coffee'])
browserify.settings('transform', [coffeeify])

app.use(express.static(__dirname + '/../public'))
app.use '/assets', browserify(__dirname+'/../src')
app.get '/assets/app.js', browserify(__dirname+'/../src/app.coffee')

module.exports =
  start: (callback) ->
    app.listen(3434, callback)