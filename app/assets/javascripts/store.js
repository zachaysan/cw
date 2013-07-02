// by default, persist application data to localStorage change this file
// to use the RESTAdapter or your own adapter.

App.Adapter = DS.RESTAdapter.extend({
  bulkCommit: false
});

// TODO: auto-add the headers

App.Store = DS.Store.extend({
  revision: 12,
  adapter:  App.Adapter.create()
});

