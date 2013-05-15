//= require_self
//= require ./store
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./templates

//= require ./router
//= require_tree ./routes

App = Ember.Application.create({LOG_TRANSITIONS: true});

App.deferReadiness();
