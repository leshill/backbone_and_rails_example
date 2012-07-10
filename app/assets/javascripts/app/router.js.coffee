class App.Router extends Backbone.Router
  routes:
    ''           : 'listMovies'
    'movies/:id' : 'showMovie'
