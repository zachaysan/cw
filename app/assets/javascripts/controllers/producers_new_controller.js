App.ProducersNewController = Em.ObjectController.extend({
  startEditing: function() {
    this.transaction = this.get('store').transaction();
    this.set('content', this.transaction.createRecord(App.Producer, {}));
  },

  stopEditing: function() {
    if (this.transaction) {
      this.transaction.rollback();
      this.transaction = null;
    }
  },

  save: function() {
    this.transaction.commit();
    this.transaction = null;
  },

  transitionAfterSave: function() {
    if (this.get('content.id')) {
      this.transitionToRoute('producer', this.get('content'));
    }
  }.observes('content.id'),

  cancel: function() {
    this.stopEditing();
    this.transitionToRoute('producers.index');
  },

  addPhoneNumber: function() {
    this.get('content.phoneNumbers').createRecord();
  },

  removePhoneNumber: function(phoneNumber) {
    phoneNumber.deleteRecord();
  }
});
