App.FinancesController = Ember.ArrayController.extend
  assets: (-> @filterBy 'type', 'Asset').property('@each.type')
  expenses: (-> @filterBy 'type', 'Expense').property('@each.type')