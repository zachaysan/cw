App.AccessTokenNewController = Ember.ObjectController.extend({

  startEditing: function(){
    this.transaction = this.get('store').transaction();
    this.access_token = this.transaction.createRecord(App.AccessToken, {})
    this.set('content', this.access_token);
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
  },

  transitionAfterCreateAccessToken: function() {
    console.log("time to handle the route change");
  }.observes('content.id')

});
