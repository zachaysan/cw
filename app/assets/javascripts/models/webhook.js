App.Webhook =    DS.Model.extend({
  postUri:       DS.attr('string'),
  postData:      DS.attr('string'),
  attempt:       DS.attr('boolean'),
  failed:        DS.attr('boolean'),
  createdAt:     DS.attr('string'),
  attemptCount:  DS.attr('string'),
  attemptExplanation: DS.attr('string'),
  consumer:      DS.belongsTo('App.Consumer'),

  createdDate: function(){
    var createdAt = this.get('createdAt');
    
    return createdAt;
  }.property('createdAt'),
});
