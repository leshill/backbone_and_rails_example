window.App = {
  Views: {}
}

$(->
  return unless App.init
  view = new App.Views.Index
    data: App.init
    el: $('body')
  view.render()
)
