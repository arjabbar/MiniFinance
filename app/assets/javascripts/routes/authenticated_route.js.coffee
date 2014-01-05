App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition)->
    loggedIn = @controllerFor('application').get 'isLoggedIn'
    if not loggedIn 
      @transitionTo 'login'