App.IndexRoute = Ember.Route.extend({
  model: function() {
    return App.Place.findAll();
  }
});
