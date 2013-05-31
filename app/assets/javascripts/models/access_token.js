App.AccessToken = DS.Model.extend({
  email:        DS.attr('string'),
  password:     DS.attr('string')
  
  // After the post response updates the model 
  // we must add the AccessToken.token attr.
});
