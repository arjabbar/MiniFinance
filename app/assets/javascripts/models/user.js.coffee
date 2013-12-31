App.User = DS.Model.extend
  firstName: DS.attr 'string'
  lastName: DS.attr 'string'
  middleName: DS.attr 'string'
  email: DS.attr 'string'
  imageUrl: DS.attr 'string'
  fullName: (-> 
    middleName = @get('middleName') || ''
    "#{@get 'firstName'} #{middleName} #{@get 'lastName'}"
    ).property('firstName', 'middleName', 'lastName')
