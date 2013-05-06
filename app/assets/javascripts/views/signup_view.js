App.SignupView = Ember.View.extend({
  didInsertElement: function() {
    $('input:first').focus();
  }
});
