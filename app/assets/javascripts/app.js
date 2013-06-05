//= require_self
//= require ./store
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./templates

//= require ./router
//= require_tree ./routes

var SUPER_DEBUG = false;

Ember.LOG_BINDINGS = SUPER_DEBUG;

App = Ember.Application.create({LOG_TRANSITIONS: SUPER_DEBUG});

App.deferReadiness();
