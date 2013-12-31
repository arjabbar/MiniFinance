App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition)->
    loggedIn = @controllerFor('login').get('isLoggedIn')
    if not loggedIn then @transitionTo 'login'