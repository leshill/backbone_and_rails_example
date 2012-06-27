#= require app/view

class App.CollectionView extends App.View

  initialize: (options) ->
    super

    @selector ||= options.selector
    @view ||= options.view

    @collection.on 'reset', @reset, @

  container: ->
    @_container ||= @_ensureContainer()

  getView: (model) ->
    @view.apply @, [model]

  render: ->
    super
    @reset()
    @

  renderContext: ->
    { collection: @collection }

  reset: (collection, options) ->
    @container().html ''
    @collection.each (model) =>
      @container().append @getView(model).show().$el

  _ensureContainer: ->
    if @selector?
      @$(@selector)
    else
      @$el
