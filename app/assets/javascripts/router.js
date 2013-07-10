App.Router.map(function() {
  this.resource("producers", function(){});
  this.resource("producer", { path: 'producer/:producer_id' });
  this.resource("consumer", { path: 'consumer/:consumer_id' });
  this.resource("user", function(){
    this.route("new");
  });
  this.resource("access_token", function(){
    this.route("new");
  });
});
