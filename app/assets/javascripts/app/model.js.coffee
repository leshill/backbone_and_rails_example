# Mixin our own Model methods
# Alternately you could create a base class
#   class App.Model extends Backbone.Model
_.extend Backbone.Model.prototype,
  errorMessageFor: (key, validation) ->
    if @errors?[key]? && @errors[key][validation]?
      @errors[key][validation]
