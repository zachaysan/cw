App.ApplicationRoute = Ember.Route.extend({
  hideNewEventDialog: function() {
    // TODO remove need for empty template
    this.render('emptyTemplate', {into: 'application', outlet: 'modalOutlet'});
  }
});
