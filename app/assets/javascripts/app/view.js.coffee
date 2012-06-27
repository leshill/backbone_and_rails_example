class App.View extends Backbone.View
  initialize: (options) ->
    @template ||= options.template

  render: ->
    if @template?
      @$el.html(@renderTemplate(@template, @renderContext(), @renderPartials()))
    @

  renderContext: ->
    {}

  renderPartials: ->
    {}

  renderTemplate: (template, context, partials) ->
    @_template(template).render context, partials

  _template: (template) ->
    HoganTemplates[template]
