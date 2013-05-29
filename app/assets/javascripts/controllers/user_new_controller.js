App.UserNewController = Ember.ObjectController.extend({

  startEditing: function(){
    this.transaction = this.get('store').transaction();
    this.set('content', this.transaction.createRecord(App.User, {}));
  },


  stopEditing: function(){
    if (this.transaction) {
      this.transaction.rollback();
      this.transaction = null;
    }
  },

  createUser: function(){
    this.transaction.commit();
    this.transaction = null;
  }

});
