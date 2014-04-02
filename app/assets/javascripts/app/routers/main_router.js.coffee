class App.Routers.MainRouter extends Backbone.Router

  routes:
    "": "index"
    "projects": "project"
    "projects/new": "newProject"
    "projects/:id": "showProject"

  initialize: ->
    @headerView = new App.Views.Header()
    @contentView = new App.Views.Content()

  index: ->
    @layoutView()
    @contentView.swapMain(new App.Views.Ads())
    @contentView.swapSide(new App.Views.News())

  project: ->
    @layoutView()
    @contentView.swapMain(new App.Views.Empty())
    @contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))

  newProject: ->
    @layoutView()
    @contentView.swapMain(new App.Views.NewProject({ model: new App.Models.Project }))
    @contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))

  showProject: (id) ->
    @layoutView()
    @contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))
    model = new App.Models.Project({ id: id })
    @contentView.swapMain(new App.Views.ProjectDetails({ model: model }))

  layoutView: ->
    $('#header').html(@headerView.render().el)
    $('#content').html(@contentView.render().el)
