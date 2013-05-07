App.UserController = Ember.Controller.extend({
  needs: "application",
  applicationBinding: "controllers.application",

  email: null,
  password: null,
  errorMessage: null,
  isProcessing: null,

  createAccount: function() {
    this.setProperties({
      "errorMessage": null,
      "isProcessing": "true"
    });

    var that = this;
    user.signUp(null, {
      success: function(user) {
        that.setProperties({
          "application.currentUser": true,
          "isProcessing": null
        });
        that.transitionToRoute('index');
      },
      error: function(user, error) {
        that.set("isProcessing", null);
        switch(error.code) {
          case -1:
            that.set("errorMessage", "You are missing some information");
          break;

          case 202:
            that.set("errorMessage", "That email address is already in use");
          break;

          case 125:
            that.set("errorMessage", "You need a real email address");
          break;
        }
      }
    });
  }
});
