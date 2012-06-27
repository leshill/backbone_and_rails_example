window.App = {
  Collections: {}
  Models: {}
  Presenters: {}
  Views: {}
}

$(->
  return unless App.init

  movies = new App.Collections.Movies App.init

  selectionModel = new App.SelectionModel(movies)

  view = new App.Views.Index
    collection: movies
    el: $('body')
    selectionModel: selectionModel
    selector: '#movie_list'
    view: (model) ->
      new App.Views.Movie
        model: model
        presenter: (model) ->
          new App.Presenters.Movie model

  selectionModel.bind 'select:none', () ->
    view.show()

  router = new App.Router selectionModel: selectionModel
  Backbone.history.start pushState: true
)
