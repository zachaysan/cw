// by default, persist application data to localStorage change this file
// to use the RESTAdapter or your own adapter.

App.Adapter = DS.RESTAdapter.extend({
  bulkCommit: false
});

App.Store = DS.Store.extend({
  revision: 12
});
