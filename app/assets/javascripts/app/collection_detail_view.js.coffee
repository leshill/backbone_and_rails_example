#= require app/view

class App.CollectionDetailView extends App.View
  initialize: (options) ->
    super
    @viewCache = new App.Cache

    @view = options.view

    @selectionModel.on 'select:none', @hideDetail, @
    @selectionModel.on 'select', @showDetail, @

  hideDetail: ->
    @currentView?.hide()

  showDetail: (model) ->
    @currentView?.hide()
    unless view = @viewCache.get(model)
      view = @view.apply @, [model]
      @viewCache.add view
      @$el.append view.render().$el
    @currentView = view
    @currentView.show()
