App.UserEditController = Ember.ObjectController.extend({
  needs: ['user'],

  startEditing: function(){
    var user = this.get('content');
    var transaction = user.get('store').transaction();

    transaction.add(user);
    this.transaction = transaction;
  },

  stopEditing: function(){
    var transaction = this.transaction;
    if (transaction){
      transaction.rollback();
      this.transaction = undefined;
    }
  }
});
