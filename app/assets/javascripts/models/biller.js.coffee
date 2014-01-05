App.Biller = DS.Model.extend
  name: DS.attr 'string'
  website: DS.attr 'string'
  phone: DS.attr 'string'
  createdAt: DS.attr 'date'
  updatedAt: DS.attr 'date'
  finances: DS.hasMany 'finance' 