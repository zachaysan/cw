App.UserEditController = Ember.ObjectController.extend({
  needs: ['contact'],

  startEditing: function() {
    var user = this.get('content');
    var transaction = user.get('store').transaction();

    transaction.add(user);
    this.transaction = transaction;

  }
});
