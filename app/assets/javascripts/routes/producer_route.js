App.ProducerRoute = App.AuthRoute.extend({
  model: function(params){
    var producer = App.Producer.find(params.producer_id);
    return producer;
  }
});
