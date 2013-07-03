App.ApplicationController = Ember.Controller.extend({
  currentUser: !!localStorage.access_token,

  updateCurrentUser: function(){
    console.log("updating the user");
    currentUser: !!localStorage.access_token
  },
  
  logOut: function(){
    // there should only be one accesstoken, but lets just 
    // assume that we've somehow made more than we need
    this.access_tokens = this.get('store').findAll(App.AccessToken);
    this.access_tokens.forEach(function(access_token){
      console.log(access_token);
    });
    localStorage.removeItem('access_token');
    /*
    this.transaction = this.get('store').transaction();
    this.access_token = this.transaction
    */

    console.log("logout");
    this.updateCurrentUser();
    // For some reason templates don't update with information 
    // without a reload, so we reload here. See also
    // access_token_new_controller
    location.reload();
  },

  resetHeaders: function(){
    console.log('resetting headers');
    Ember.$.ajaxSetup({
      headers: { 'AUTHORIZATION': localStorage.access_token }
    });
  }
});
