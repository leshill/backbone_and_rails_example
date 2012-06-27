class App.Views.New extends App.View
  template: 'new'

  events: ->
    _.extend super
      'click a.cancel': 'closeForm'

  closeForm: (event) ->
    event.preventDefault()
    @hide()
