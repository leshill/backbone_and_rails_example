window.App = {
  Collections: {}
  Models: {}
  Presenters: {}
  Views: {}
}

$(->
  return unless App.init

  moviePresenter = (model) -> new App.Presenters.Movie model

  movies = new App.Collections.Movies App.init

  selectionModel = new App.SelectionModel(movies)

  list = new App.Views.List
    collection: movies
    el: $('#list')
    selectionModel: selectionModel
    selector: '#movie_list'
    view: (model) ->
      new App.Views.Movie
        model: model
        presenter: moviePresenter

  detail = new App.CollectionDetailView
    collection: movies
    el: $('#details')
    selectionModel: selectionModel
    view: (model) ->
      new App.Views.Show
        model: model
        presenter: moviePresenter

  App.router = new App.Router selectionModel: selectionModel

  Backbone.history.start pushState: true
)
