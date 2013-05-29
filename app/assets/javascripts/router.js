App.Router.map(function() {
  this.resource("user", function(){
    this.route("new");
    // Not sure if I should put the access token
    // resource in here
  });
  // or to keep it as a separate resource here
  this.resource("access_token", function(){
    // Need to figure out how to set this to /login
    this.route("new");
  });
});
