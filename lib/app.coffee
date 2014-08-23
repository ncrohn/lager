express = require('express')
app = express()

redis = require('redis')
client = redis.createClient()

browserify = require('browserify-middleware')
coffeeify = require('coffeeify')

browserify.settings('extensions', ['.coffee'])
browserify.settings('transform', [coffeeify])

app.use(express.static(__dirname + '/../public'))
app.use '/assets', browserify(__dirname+'/../src')
app.get '/assets/app.js', browserify(__dirname+'/../src/app.coffee')

app.get '/temps', (req, res) ->

  client.lrange 'temps', (err, data) ->
    res.send(500, { error: err }) if err

    res.send(200, JSON.stringify(data))

module.exports =
  start: (callback) ->
    app.listen(3434, callback)