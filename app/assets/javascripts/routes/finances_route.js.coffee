App.FinancesRoute = App.AuthenticatedRoute.extend
  model: ->
    @store.find 'finance'
