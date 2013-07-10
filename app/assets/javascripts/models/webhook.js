App.Webhook = DS.Model.extend({
  post_uri:   DS.attr('string'),
  post_data:  DS.attr('string'),
  attempt:    DS.attr('boolean'),
  failed:     DS.attr('boolean'),
  consumers:  DS.belongsTo('App.Consumer'),
});
