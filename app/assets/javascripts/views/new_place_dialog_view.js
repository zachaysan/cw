App.NewPlaceDialogView = Ember.View.extend({
  didInsertElement: function() {
    this.$().addClass('fadein');
    this.$().find('.dialog').position({
      my: "center center-50",
      at: "center",
      of: ".dialogshadow"
    });
    this.$().find('input:first').focus();
  }
});
