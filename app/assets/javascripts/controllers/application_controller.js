App.ApplicationController = Ember.Controller.extend({
  currentUser: false, // if a current user logged in

  logOut: function() {
    Parse.User.logOut();
    this.set("currentUser", false);
  }
});
