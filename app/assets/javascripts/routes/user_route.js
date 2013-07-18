App.UserRoute = App.Route.extend({
  setupController: function(controller, model){
    if (controller.get('isEditing')) {
      controller.stopEditing();
    }
  },
  
  deactivate: function(){
    var controller = this.controllerFor('user');

    if (controller.get('isEditing')) {
      controller.stopEditing();
    }
  }
});
