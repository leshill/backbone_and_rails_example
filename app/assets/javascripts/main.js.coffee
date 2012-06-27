window.App = {
  Collections: {}
  Models: {}
  Presenters: {}
  Views: {}
}

$(->
  return unless App.init
  collection = new App.Collections.Movies(App.init)
  view = new App.Views.Index
    collection: collection
    el: $('body')
    selector: '#movie_list'
    view: (model) ->
      new App.Views.Movie
        model: model
        presenter: (model) ->
          new App.Presenters.Movie model

  view.show()
)
