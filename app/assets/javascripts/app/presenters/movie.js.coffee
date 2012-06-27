class App.Presenters.Movie extends App.Presenter

  opening_weekend: ->
    '$' + format '#,##0.00', @get('opening_weekend')

  percent_of_total: ->
    format('##0.00', @get('percent_of_total')) + '%'

  total_gross: ->
    '$' + format '#,##0.00', @get('total_gross')
