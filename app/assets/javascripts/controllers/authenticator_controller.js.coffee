App.AuthenticatorController = Ember.Controller.extend
  setStateToLoggedIn: (data, status, request)-> 
    token = request.getResponseHeader App.API_TOKEN_HEADER
    appController = App.__container__.lookup 'controller:application'
    appController.setProperties isLoggedIn: true, token: token, session: data.session 
    appController.transitionToRoute 'finances'
