App.ConsumerController = Ember.ObjectController.extend({
  name: null,

  destroyRecord: function() {
    if (window.confirm("Are you sure you want to delete this consumer?")) {
      this.get('content').deleteRecord();
      this.get('store').commit();
      this.get('target.router').transitionTo('producers.index');
    }
  }
});
