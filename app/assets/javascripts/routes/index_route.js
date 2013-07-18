App.IndexRoute = App.AuthRoute.extend({
  redirect: function() {
    this.transitionTo('producers');
  }
});
