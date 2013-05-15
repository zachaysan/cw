App.UsersNewRoute = Ember.Route.extend({
  model: function() {
    // the record gets created in the controller
    console.log("woah nelly!!!!");
    return null;
  },

  setupController: function(controller) {
    console.log("about to setup");
    controller.startEditing();
  },
  
  deactivate: function(controller) {
    this.controllerFor('users.new').stopEditing();
  }

});
