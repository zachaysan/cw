App.UserController = Ember.ObjectController.extend({
  isEditing: false,
  needs: ['userEdit'],

  startEditing: function(){
    var userEditController = this.get('controllers.userEdit');
    userEditController.set('content', this.get('content'));
    userEditController.startEditing();
    this.set('isEditing', true);
  }
});
