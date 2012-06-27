class App.Views.New extends App.FormView
  template: 'new'

  initialize: ->
    super
    @on 'form.done',
      -> @closeForm()
      this

  clearForm: ->
    @$('input[type=text]').val ''

  closeForm: (event) ->
    event?.preventDefault()
    @clearForm()
    @clearErrors()
    @hide()

  events: ->
    _.extend super,
      'click a.cancel': 'closeForm'
      'submit form': 'formSubmit'
