class App.Views.Index extends App.CollectionView
  template: 'index'

  initialize: (options) ->
    super

    @collection.on 'add', @highlightNewView, @
    @selectionModel.on 'select:none', @show, @
    @selectionModel.on 'select', @hide, @

  events: ->
    _.extend super,
      'click a.add': 'showAddMovie'

  highlightNewView: (model, collection, options) ->
    @getView(model).$el.effect 'highlight', 'slow'

  render: ->
    super
    @addMovie = new App.Views.New
      collection: @collection
      el: @$('#new_movie')
    @addMovie.hide()

  showAddMovie: (event) ->
    event.preventDefault()
    @addMovie.show()
