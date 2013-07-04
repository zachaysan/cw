App.ProducersRoute = Ember.Route.extend({
  setupController: function(controller, model){},

  model: function(){
    return App.Producer.find();
  }
});
