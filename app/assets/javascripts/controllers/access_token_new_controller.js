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
    if (this.get('content.id')) {
      // Save the access token so we can log in forever
      localStorage.access_token = this.get('content.id');
      this.transitionToRoute('user.new');
    }
  }.observes('content.id')

});
