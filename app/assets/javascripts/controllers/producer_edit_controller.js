App.ProducerEditController = Em.ObjectController.extend({
  needs: ['producer'],

  startEditing: function() {
    var producer = this.get('content');
    console.log("sadface");
    console.log(producer);

    var transaction = producer.get('store').transaction();
    transaction.add(producer);
    this.transaction = transaction;
  },

  stopEditing: function() {
    var transaction = this.transaction;
    if (transaction) {
      transaction.rollback();
      this.transaction = undefined;
    }
  },

  save: function() {
    this.transaction.commit();
    this.transaction = undefined;
    this.get('controllers.producer').stopEditing();
  },

  cancel: function() {
    this.get('controllers.producer').stopEditing();
  },
});
