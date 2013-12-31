App.UsersIndexRoute = App.AuthenticatedRoute.extend
  model: -> @store.find 'user'
