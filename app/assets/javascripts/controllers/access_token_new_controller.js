App.AccessTokenNewController = Ember.ObjectController.extend({
  needs: ['application'],

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
      var applicationController = this.get('controllers.application');
      applicationController.updateCurrentUser();
      
      // Reload to change top bar's state
      location.reload();
    }
  }.observes('content.id')

});
