class App.Presenters.Movie extends App.Presenter

  opening_weekend: ->
    '$' + format '#,##0.00', @get('opening_weekend')
