App.Producer  = DS.Model.extend({
  name:         DS.attr('string'),
  user:         DS.belongsTo('App.User')
});
