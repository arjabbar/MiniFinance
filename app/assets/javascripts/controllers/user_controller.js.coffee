App.UserController = Ember.Controller.extend
	fullName: (-> 
		"#{@get 'model.firstName'} #{@get 'model.lastName'}"
		).property('model.firstName', 'model.middleName', 'model.lastName')