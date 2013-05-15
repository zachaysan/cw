App.UserController = Ember.ObjectController.extend({
  // I think the reason we need to delineate these
  // is that we do not have a matching array controller.
  // Or *maybe* something magical, like missing 
  // plurilization. Still not sure, but I know I shouldn't
  // need to in an ideal world.
  email: null,
  password: null,

  isEditing: false,
  needs: ['userEdit'],

  startEditing: function(){
    var userEditController = this.get('controllers.userEdit');
    userEditController.set('content', this.get('content'));
    userEditController.startEditing();
    this.set('isEditing', true);
  },
  
  stopEditing: function(){
    var userEditController = this.get('controllers.userEdit');
    userEditController.stopEditing();
    this.set('isEditing', false);
  }
});
