App.NavbarController = Ember.Controller.extend
  needs: 'application'
  isLoggedIn: Ember.computed.alias 'controllers.application.isLoggedIn'
  session: Ember.computed.alias 'controllers.application.session' 
  