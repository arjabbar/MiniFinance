App.LoginController = Ember.Controller.extend
  needs: 'application'
  application: Ember.computed.alias 'controllers.application'
  currentUser: Ember.computed.alias 'application.model'
  token: ( (key, value)-> if value then localStorage.token = value else localStorage.token ).property()
  session: ( (key, value)-> if value then localStorage.session = value else localStorage.session ).property()
  actions: 
    login: ->
      controller = @
      post = $.post('login', {email: @get('email'), password: @get('password')})
        .success((data, status, request)-> 
          token = request.getResponseHeader 'API_TOKEN'
          controller.setProperties isLoggedIn: true, token: token)
        .fail( (data, status, request) ->
          controller.send 'loginFailed' )
        .done -> controller.send 'clearCredentials' 
    clearCredentials: ->
      @set 'password', ''
    loginFailed: ->
      @incrementProperty 'failedAttempts'
      @transitionTo 'login'