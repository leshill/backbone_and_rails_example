class App.Views.Show extends App.View
  template: 'show'
  class: 'movie'

  backToList: (event) ->
    event.preventDefault()
    App.router.navigate '/', trigger: true

  deleteMovie: (event) ->
    event.preventDefault()
    if window.confirm('Are you sure?')
      @model.destroy()
      App.router.navigate '/', trigger: true

  events: ->
    _.extend super,
      'click a.back': 'backToList'
      'click a.delete': 'deleteMovie'
