App.Router.map ()->
  @route 'home', path: '/'
  @route 'login'
  @resource 'users', -> 
    @route 'show', path: '/:userId'
