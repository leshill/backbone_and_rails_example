class App.Controllers.Movies
  constructor: (data, router) ->
    movies = new App.Collections.Movies data
    selectionModel = new App.SelectionModel(movies)

    moviePresenter = (model) -> new App.Presenters.Movie model

    new App.Views.List
      collection: movies
      el: $('#list')
      selectionModel: selectionModel
      selector: '#movie_list'
      view: (model) ->
        new App.Views.Movie
          model: model
          presenter: moviePresenter

    new App.CollectionDetailView
      collection: movies
      el: $('#details')
      selectionModel: selectionModel
      view: (model) ->
        new App.Views.Show
          model: model
          presenter: moviePresenter

    router.on 'route:listMovies', () ->
      selectionModel.select()

    router.on 'route:showMovie', (movieId) ->
      selectionModel.select movieId
