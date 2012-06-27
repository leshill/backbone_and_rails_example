class App.Views.Index extends App.View
  template: 'index'

  initialize: (options) ->
    super
    @data = options.data

  renderContext: ->
    _.extend super, movies: @data
