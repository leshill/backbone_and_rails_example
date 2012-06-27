class App.Cache
  constructor: ->
    @reset()

  add: (other) ->
    @_byModelCid[other.model.cid] = other
    @_byCid[other.cid] = other

  get: (model) ->
    @_byModelCid[model.cid]

  remove: (model) ->
    other = @get model
    if other?
      delete @_byModelCid[model.cid]
      delete @_byCid[other.cid]

  reset: ->
    @_byModelCid = {}
    @_byCid = {}
