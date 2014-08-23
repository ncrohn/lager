Backbone = require('backbone')

counter = 0

data = (iter) ->
  x = ['x']
  sin = ['sin']
  cos = ['cos']

  if iter
    x.push(iter)
    sin.push(Math.sin(iter/10))
    cos.push(.5 * Math.cos(iter/10))
  else
    for i in [0..100]
      x.push(i)
      sin.push(Math.sin(i/10))
      cos.push(.5 * Math.cos(i/10))
      counter = i

  return [x, sin, cos]

class TempGraphView extends Backbone.View

  tagName: 'div'
  className: 'temp-graph'

  initialize: (options) ->
    @_c3 = options?.c3 or window.c3
    @_d3 = options?.d3 or window.d3

    @_data = data()

  render: ->
    unless @_chart

      @_chart = @_c3.generate
        bindto: '#chart'
        data:
          x: 'x',
          columns: @_data
          type: 'spline'

      @$el.append(@_chart.element)

    return @

  _updateGraph: =>
    # TODO make this work

module.exports = TempGraphView