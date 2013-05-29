App.AccessTokenNewRoute = Ember.Route.extend({
  model: function() {
    // the record gets created in the controller
    return null;
  },

  setupController: function(controller) {
    controller.startEditing();
  },
  
  deactivate: function(controller) {
    this.controllerFor('access_token.new').stopEditing();
  }

});
