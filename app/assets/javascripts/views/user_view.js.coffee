App.UserView = Ember.View.extend
  user: Ember.computed.alias 'controller.model'
  imageUrl: Ember.computed.alias 'user.imageUrl'
  style: (-> "background-image: url(#{@get 'imageUrl'})" ).property('imageUrl')
  templateName: 'user'
  tagName: 'li'
  classNames: ['user']
  attributeBindings: ['style', 'user.firstName:title']
  linkText: (-> "View #{user.firstName}'s Profile").property('user.firstName')
