Cw.LoginController = Ember.Controller.extend({
  needs: "application",
  applicationBinding: "controllers.application",

  email: null,
  password: null,
  errorMessage: null,
  isProcessing: null,

  login: function() {
    this.setProperties({
      "errorMessage": null,
      "isProcessing": "yes"
    });
    that = this;

    Parse.User.logIn(this.get("email"), this.get("password"), {
      success: function(user) {
        that.setProperties({
          "application.currentUser": true,
          "isProcessing": null
        });
        that.transitionToRoute('index');
      },
      error: function(user, error) {
        that.setProperties({
          "errorMessage": "Nope. Try again.",
          "isProcessing": null
        });
      }
    });
  }
});
