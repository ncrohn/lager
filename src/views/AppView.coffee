Backbone = require('backbone')

TempGraphView = require('./TempGraphView')

class AppView extends Backbone.View

  el: '.app-view'

  render: ->
    tempGraphView = new TempGraphView()
    @$el.append(tempGraphView.render().el)
    return @

module.exports = AppView