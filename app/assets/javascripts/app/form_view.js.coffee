class App.FormView extends App.View
  initialize: (options) ->
    super
    @on 'form.always', @_completed, @

  clearErrors: ->
    @$('label.error span.error').remove()
    @$('label.error').removeClass 'error'
    @$('input.error, textarea.error').removeClass 'error'

  displayError: (key, message) ->
    label = @$("label[for=#{key}]")
    label.addClass 'error'
    if message?
      label.append "<span class='error'>#{message}</span>"
    @$("[name=#{key}]").addClass 'error'

  displayErrors: (model, errors) ->
    _.each errors, (failedArray, key) =>
      @displayError key, @errorMessageFor(model, key, _.first(failedArray))

  errorMessageFor: (model, key, validation) ->
    model.errorMessageFor key, validation

  formSubmit: (event) ->
    event.preventDefault()
    @clearErrors()
    # Create returning a jqxhr would be nice
    if @model?
      # TBD
    else if @collection?
      model = @collection.create @getAttrs(),
        error: @_error
        success: @_success

  getAttrs: ->
    @clearErrors()
    Backbone.Syphon.serialize @

  onError: (model, errors, options) ->
    @displayErrors model, errors

  _completed: (model, response) ->
    $.rails.enableFormElements @$('form')

  _error: (model, errors, options) =>
    @onError model, errors, options
    @trigger 'form.fail', model, errors, options
    @trigger 'form.always', model, errors, options

  _success: (model, response) =>
    @trigger 'form.done', model, response
    @trigger 'form.always', model, response
