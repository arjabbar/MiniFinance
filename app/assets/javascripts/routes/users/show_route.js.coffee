App.UsersShowRoute = App.AuthenticatedRoute.extend
  model: (params)->
    @store.find 'user', params.userId