class App.Views.Index extends App.CollectionView
  template: 'index'

  events: ->
    _.extend super,
      'click a.add': 'showAddMovie'

  render: ->
    super
    @addMovie = new App.Views.New
      el: @$('#new_movie')
    @addMovie.hide()

  showAddMovie: (event) ->
    event.preventDefault()
    @addMovie.show()
