class App.SelectionModel
  _.extend this.prototype, Backbone.Events

  constructor: (collection) ->
    @collection = collection

  select: (model_or_id) ->
    model = if _.isObject model_or_id
      @collection.getByCid model_or_id.cid
    else
      @collection.get model_or_id

    if _.isEmpty model
      @trigger 'select:none'
    else
      @trigger 'select', model
