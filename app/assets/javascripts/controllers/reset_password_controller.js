Cw.ResetPasswordController = Ember.Controller.extend({
  email: null,
  errorMessage: null,
  isProcessing: null,

  resetPassword: function() {
    this.setProperties({
      "errorMessage": null,
      "isProcessing": "true"
    });
    that = this;

    Parse.User.requestPasswordReset(this.get("email"), {
      success: function() {
        // Password reset request was sent successfully
        that.setProperties({
          "isProcessing": null,
          "email": null
        });
        that.transitionToRoute("login");
      },
      error: function(error) {
        that.set("isProcessing", null);

        if (that.get("email")) {
          that.set("errorMessage", "There is no account with that email address.");
        } else {
          that.set("errorMessage", "We need an email address to check!");
        }
      }
    });
  }
});
