App.BillersRoute = App.AuthenticatedRoute.extend
  model: -> @store.find 'biller'