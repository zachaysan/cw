App.WebhookRoute = App.AuthRoute.extend({
  renderTemplate: function(){
    this.render({ outlet: 'webhook' });
  }
});
