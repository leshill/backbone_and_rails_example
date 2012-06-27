class App.Router extends Backbone.Router
  routes:
    '' : 'listMovies'

  initialize: (options) ->
    @selectionModel = options.selectionModel

  listMovies: ->
    @selectionModel.select()
