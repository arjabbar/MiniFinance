App.NavbarController = Ember.Controller.extend
  needs: ['login', 'application']
  currentUser: Ember.computed.alias 'controllers.application.currentUser'
  loggedIn: Ember.computed.alias 'controllers.login.isLoggedIn'