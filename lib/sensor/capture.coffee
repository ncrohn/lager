sense = require('ds18b20')
redis = require('redis')

client = redis.createClient()

readTemps = (ids) ->
  for id in ids
    sense.temperature id, (err, value) ->
      c = value
      f = Math.round((c * (9/5) + 32)*1000)/1000
      client.lpush('temps', f+';'+ (+new Date()))
      console.log('Reading temp as', f)

  setTimeout ->
    readTemps(ids)
  , 1000*30

sense.sensors (err, ids) ->
  if err
    throw err

  readTemps(ids)