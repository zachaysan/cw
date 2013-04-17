Cw.LoginView = Ember.View.extend({
  didInsertElement: function() {
    $('input:first').focus();
  }
});
