App.ApplicationController = Ember.Controller.extend({
  currentUser: !!localStorage.access_token,
  
  logOut: function(){
    console.log("logout");
  }
});
