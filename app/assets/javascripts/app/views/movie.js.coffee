class App.Views.Movie extends App.View
  template: 'movie'

  events: ->
    _.extend super,
      'click .name a' : 'showMovie'

  showMovie: (event) ->
    event.preventDefault()
    App.router.navigate @model.url(), trigger: true
