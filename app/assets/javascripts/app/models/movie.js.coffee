class App.Models.Movie extends Backbone.Model
  errors:
    name:
      required: 'Please enter a name for the movie'
    opening_weekend:
      required: 'Please enter the opening weekend total'
      number: 'Opening weekend total must be a number'
    total_gross:
      required: 'Please enter the total gross'
      number: 'Total gross must be a number'

  validate:
    name:
      required: true
    opening_weekend:
      required: true
      type: 'number'
    total_gross:
      required: true
      type: 'number'
