class App.View extends Backbone.View
  initialize: (options) ->
    @template ||= options.template

  html: (html) ->
    @$el.html html
    @

  render: ->
    @_rendered = true
    if @template?
      @html @renderTemplate(@template, @renderContext(), @renderPartials())
    @

  renderContext: ->
    if @model?
      @model.toJSON()
    else
      {}

  renderPartials: ->
    {}

  renderTemplate: (template, context, partials) ->
    @_template(template).render context, partials

  show: ->
    @render() unless @_rendered?
    @$el.show()
    @

  _template: (template) ->
    HoganTemplates[template]
