App.Producer = DS.Model.extend({
  name:           DS.attr('string'),
  webhookCount:  DS.attr('string'),
  consumerCount: DS.attr('string'),
  consumers:      DS.hasMany('App.Consumer'),
});
