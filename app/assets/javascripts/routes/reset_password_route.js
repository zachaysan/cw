App.ResetPasswordRoute = Ember.Route.extend({
  setupController: function(controller) {
    // If already a user logged in, redirect to index page
    var user = Parse.User.current();
    if (user) {
      this.transitionToRoute('index');
    }

    controller.setProperties({
      "email": "",
      "errorMessage": ""
    });
  }
});
