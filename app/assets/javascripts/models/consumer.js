App.Consumer = DS.Model.extend({
  name:           DS.attr('string'),
  webhook_count:  DS.attr('string'),
  producer:       DS.belongsTo('App.Producer'),
});
