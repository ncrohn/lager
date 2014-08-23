Backbone = require('backbone')
$ = Backbone.$

getData = (cb) ->
  x = ['x']
  temps = ['temps']

  $.ajax('/temps', {
    success: (payload) ->
      for d in payload
        x.push(d.time)
        temps.push(d.temp)
      cb([x, temps])
  })

class TempGraphView extends Backbone.View

  tagName: 'div'
  className: 'temp-graph'

  initialize: (options) ->
    @_c3 = options?.c3 or window.c3
    @_d3 = options?.d3 or window.d3

  render: ->
    unless @_chart

      getData (data) =>

        @_chart = @_c3.generate
          bindto: '#chart'
          data:
            x: 'x',
            columns: data
            type: 'spline'

        @$el.append(@_chart.element)

    return @

  _updateGraph: =>
    # TODO make this work

module.exports = TempGraphView