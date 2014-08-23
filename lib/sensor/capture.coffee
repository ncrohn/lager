sense = require('ds18b20')

readTemps = (ids) ->
  for id in ids
    sense.temperature id, (err, value) ->
      c = value
      f = Math.round((c * (9/5) + 32)*1000)/1000
      console.log('Reading temp as', f, 'at', new Date().toString())

  setTimeout ->
    readTemps(ids)
  , 1000*30

sense.sensors (err, ids) ->
  if err
    throw err

  readTemps(ids)