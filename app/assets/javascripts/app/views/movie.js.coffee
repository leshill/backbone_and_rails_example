class App.Views.Movie extends App.View
  template: 'movie'

  events: ->
    _.extend super,
      'click .name a' : 'showMovie'

  showMovie: (event) ->
    event.preventDefault()
    window.location = @model.url()
