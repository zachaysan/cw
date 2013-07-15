App.WebhookRoute = Ember.Route.extend({
  renderTemplate: function(){
    this.render({ outlet: 'webhook' });
  }
});
