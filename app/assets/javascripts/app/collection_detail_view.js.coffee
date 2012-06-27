#= require app/view

class App.CollectionDetailView extends App.View
  initialize: (options) ->
    super
    @viewCache = new App.Cache

    @view = options.view

    @collection.on 'destroy', @modelDestroyed, @
    @selectionModel.on 'select:none', @hideDetail, @
    @selectionModel.on 'select', @showDetail, @

  hideDetail: ->
    @currentView?.hide()

  modelDestroyed: (model, collection, options) ->
    if view = @viewCache.get(model)
      @currentView = null if @currentView == view
      @viewCache.remove(model)
      view.destroy()

  showDetail: (model) ->
    @currentView?.hide()
    unless view = @viewCache.get(model)
      view = @view.apply @, [model]
      @viewCache.add view
      @$el.append view.render().$el
    @currentView = view
    @currentView.show()
