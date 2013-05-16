App.UserNewRoute = Ember.Route.extend({
  model: function() {
    // the record gets created in the controller
    return null;
  },

  setupController: function(controller) {
    controller.startEditing();
  },
  
  deactivate: function(controller) {
    this.controllerFor('user.new').stopEditing();
  }

});
