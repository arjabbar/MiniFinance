App.ApplicationController = Ember.ObjectController.extend
  needs: 'login'
  loginController: Ember.computed.alias 'controllers.login'
  token: ( (key, value)-> if value then localStorage.token = value else localStorage.token ).property()
  session: ( (key, value)-> if value then localStorage.session = value else localStorage.session ).property()
  isLoggedIn: false
  init: ->
    @_super()
  testIfTokenExpired: (->
        self = @ 
        App.$.post('login', token: @get 'token')
          .success( (data)-> 
            self.setProperties isLoggedIn: true, session: data.session
            self.transitionToRoute 'finances')
          .fail -> self.send 'clearToken').on('init')
  actions:
    clearToken: -> localStorage.clear() 
