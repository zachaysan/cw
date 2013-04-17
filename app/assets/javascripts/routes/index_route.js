Cw.IndexRoute = Ember.Route.extend({
  model: function() {
    return Cw.Place.findAll();
  }
});
