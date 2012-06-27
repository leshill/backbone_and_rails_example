class App.Presenter

  constructor: (model) ->
    @model = model
    (@[key] = value unless @[key]?) for own key, value of @model.attributes

  get: (name) ->
    @model.get name
