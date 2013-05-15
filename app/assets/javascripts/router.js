
App.Router.map(function() {
  this.resource("user", function(){
    this.route("new");
  });
  this.route("login", { path: "/login" });
  this.route("resetPassword", { path: "/forgot_password" });
});
