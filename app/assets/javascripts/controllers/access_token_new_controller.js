App.AccessTokenNewController = Ember.ObjectController.extend({

  startEditing: function(){
    this.transaction = this.get('store').transaction();
    this.set('content', this.transaction.createRecord(App.AccessToken, {}));
  },

  stopEditing: function(){
    if (this.transaction) {
      this.transaction.rollback();
      this.transaction = null;
    }
  },

  createAccessToken: function(){
    this.transaction.commit();
    this.transaction = null;
  }

});
