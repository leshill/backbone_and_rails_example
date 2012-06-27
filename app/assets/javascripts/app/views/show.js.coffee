class App.Views.Show extends App.View
  template: 'show'
  class: 'movie'

  backToList: (event) ->
    event.preventDefault()
    App.router.navigate '/', trigger: true

  events: ->
    _.extend super,
      'click a.back': 'backToList'
