#= require app/models/movie

class App.Collections.Movies extends Backbone.Collection
  model: App.Models.Movie
  url: '/movies'

  comparator: (model) ->
    - model.get('opening_weekend')
