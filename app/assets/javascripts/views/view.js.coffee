Ember.View.reopen
  classNames: ['animated fadeInUp']
  insertedChildren: 0
  animationDelay: 250
  willInsertElement: ->
    return unless @get('parentView') and @get 'element'
    delay = @get('animationDelay') * @get 'parentView.insertedChildren'
    @$().css 
      'animation-delay': "#{delay}ms"
      'animation-duration': "250ms"
    @incrementProperty 'parentView.insertedChildren'