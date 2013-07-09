App.Producer = DS.Model.extend({
  name:           DS.attr('string'),
  webhook_count:  DS.attr('string'),
  consumer_count: DS.attr('string'),
});
