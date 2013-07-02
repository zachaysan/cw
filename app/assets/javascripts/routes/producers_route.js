App.ProducersRoute = Ember.Route.extend({
  model: function(){
    App.Producer.find();
  }
});
