App.AccessTokenRoute = Ember.Route.extend({
  setupController: function(controller, model){
    if (controller.get('isEditing')) {
      controller.stopEditing();
    }
  },
  
  deactivate: function(){
    var controller = this.controllerFor('access_token');

    if (controller.get('isEditing')) {
      controller.stopEditing();
    }
  }
});
