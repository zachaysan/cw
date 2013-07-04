App.ProducerController = Ember.ObjectController.extend({
  name: null,

  isEditing: false,
  get_id: function(){
    return Producer.id;
  }
});
