App.Router.map ()->
  @route 'home', path: '/'
  @route 'login'
  @route 'register'
  @resource 'users', -> 
    @route 'show', path: '/:userId'
  @resource 'finances'
  @resource 'billers'
