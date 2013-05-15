App.UserController = Ember.ObjectController.extend({
  needs: "application",
  applicationBinding: "controllers.application",

  email: null,
  password: null,
  errorMessage: null,
  isProcessing: null,

  startEditing: function(){
    console.log("Why am I not being called?");
    this.transaction = this.get('store').transaction();
    this.set('content', this.transaction.createRecord(App.User, {}));
  },


  stopEditing: function(){
    if (this.transaction) {
      this.transaction.rollback();
      this.transaction = null;
    }
  },

  createUser: function() {
    this.transaction.commit();
    this.transaction = null;
  }
});
