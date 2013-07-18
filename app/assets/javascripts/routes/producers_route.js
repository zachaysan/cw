App.ProducersRoute = App.AuthRoute.extend({
  model: function(){
    return App.Producer.find();
  }
});
