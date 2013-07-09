App.ProducersRoute = Ember.Route.extend({
  model: function(){
    return App.Producer.find();
  }
});
