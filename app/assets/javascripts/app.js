App = Ember.Application.create({LOG_TRANSITIONS: true});

App.Store = DS.Store.extend({
  revision: 12
});
