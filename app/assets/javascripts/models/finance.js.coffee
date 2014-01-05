# for more details see: http://emberjs.com/guides/models/defining-models/

App.Finance = DS.Model.extend
  amountInCents: DS.attr 'number'
  recurring: DS.attr 'boolean'
  startDate: DS.attr 'date'
  endDate: DS.attr 'date'
  type: DS.attr 'string'
  createdAt: DS.attr 'date'
  updatedAt: DS.attr 'date'
  source: DS.attr 'string'
  biller: DS.belongsTo 'biller'
  dollars: (-> 
    dollars = @get('amountInCents') / 100
    "$#{dollars.toFixed 2}"
    ).property('amountInCents')
