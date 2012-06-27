class App.Router extends Backbone.Router
  routes:
    ''           : 'listMovies'
    'movies/:id' : 'showMovie'

  initialize: (options) ->
    @selectionModel = options.selectionModel

  listMovies: ->
    @selectionModel.select()

  showMovie: (id) ->
    @selectionModel.select id
