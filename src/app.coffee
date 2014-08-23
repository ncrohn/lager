$ = require('jquery')
Backbone = require('backbone')
Backbone.$ = $

AppView = require('./views/AppView')

class Lager

  constructor: (options) ->

  render: ->
    appView = new AppView()
    appView.render()


$ ->
  lager = new Lager()
  lager.render()