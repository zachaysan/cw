App.WebhookView = Ember.View.extend({
  didInsertElement: function() {
    this.$().find('.dialog').position({
      my: "center center-50",
      at: "center",
      of: "html"
    });
  }
});
