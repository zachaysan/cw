App.ProducerInListView = Em.View.extend({
  templateName: 'producer_in_list',
  tagName: 'li',
  classNameBindings: 'isActive:active',

  isActive: function() {
    return this.get('content.id') === this.get('controller.activeProducerId');
  }.property('controller.activeProducerId')
});
