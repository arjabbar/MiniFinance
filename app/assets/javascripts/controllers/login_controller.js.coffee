App.LoginController = App.AuthenticatorController.extend
  actions: 
    login: ->
      controller = @
      post = $.post('login', {email: @get('email'), password: @get('password')})
        .success(@setStateToLoggedIn)
        .fail( (data, status, request) ->
          controller.send 'loginFailed' )
        .done -> controller.send 'clearCredentials' 
    clearCredentials: ->
      @set 'password', ''
    loginFailed: ->
      @incrementProperty 'failedAttempts'
      @transitionTo 'login'