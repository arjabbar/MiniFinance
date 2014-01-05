App.RegisterController = App.AuthenticatorController.extend
  firstName: 'Abdur'
  middleName: 'Rahim'
  lastName: 'Jabbar'
  email: 'arjabbar@yahoo.com'
  password: 'keshia'
  passwordConfirmation: 'keshia'
  hasValidEmail: Ember.computed.match('email', /^.+@.+\..+$/)
  hasRequiredPassword: Ember.computed.match('password', /.{6,}/)
  hasValidPassword: (->
    @get('hasRequiredPassword') and @get('passwordsMatch')
    ).property('password', 'passwordConfirmation')
  passwordsMatch: (->
    @get('password') is @get 'passwordConfirmation').property('password', 'passwordConfirmation')
  formValid: (->
    @get('hasValidEmail') and @get('hasValidPassword') and @get('passwordsMatch')
    ).property('email', 'password', 'passwordConfirmation')
  formInvalid: Ember.computed.equal('formValid', false)
  passwordMessage: (->
    unless @get 'hasRequiredPassword' 
      "Your password must be at least 6 characters."
    else unless @get 'passwordsMatch'
      "Your passwords must match exactly."
    else
      ""
    ).property('password', 'passwordConfirmation')
  actions:
    register: ->
      controller = @
      user = underscore(@getProperties 'email', 'firstName', 'middleName', 'lastName', 'password', 'passwordConfirmation')
      App.$.post('register', user: user)
        .success(@setStateToLoggedIn)
    checkIfEmailAvailable: ->
      App.$.get('email_available', email: @get('email'))
        .fail -> alert 'Email Taken!'