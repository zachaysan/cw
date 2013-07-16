App.Consumer = DS.Model.extend({
  name:             DS.attr('string'),
  webhookCount:    DS.attr('string'),
  producer:         DS.belongsTo('App.Producer'),
  webhooks:         DS.hasMany('App.Webhook'),
  failedWebhooks:  DS.hasMany('App.Webhook'),
});
