Ember.$.ajaxSetup({
  headers: { 'AUTHORIZATION': localStorage.access_token }
});

App.Adapter = DS.RESTAdapter.extend({
  bulkCommit: false
});

App.Store = DS.Store.extend({
  revision: 12,
  adapter:  App.Adapter.create()
});
