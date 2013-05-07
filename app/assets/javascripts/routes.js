
App.Router.map(function() {
  this.resource("user", { path: "/user" });
  this.route("login", { path: "/login" });
  this.route("resetPassword", { path: "/forgot_password" });
});
