App.ResetPasswordView = Ember.View.extend({
  didInsertElement: function() {
    $('input:first').focus();
  }
});
