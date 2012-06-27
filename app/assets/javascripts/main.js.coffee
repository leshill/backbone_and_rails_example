window.App = {}

$(->
  return unless App.init
  $('body').html HoganTemplates['index'].render(movies: App.init)
)
