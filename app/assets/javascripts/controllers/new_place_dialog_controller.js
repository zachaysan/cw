Cw.NewPlaceDialogController = Ember.ObjectController.extend({
  errorMessage: null,
  isProcessing: false,

  init: function() {
    this._super();
    this.set('content', Cw.Place.create());
  },

  createPlace: function() {
    var Place = Parse.Object.extend("Place");
    var place = new Place();

    place.set("name", this.get("name"));
    place.set("image", this.get("image"));
    place.set("country", this.get("country"));
    place.set("state", this.get("state"));
    place.set("tags", (this.get("tags") || '').split(','));
    place.set("isScenic", this.get("isScenic"));
    place.set("isHistoric", this.get("isHistoric"));
    place.set("isCultural", this.get("isCultural"));

    that = this;
    place.save(null, {
      success: function(place) {
        // TODO
        that.set('content', Cw.Place.create());
      },
      error: function(place, error) {
        that.set("errorMessage", error.message);
      }
    });
  },

  addImage: function() {
    this.set("image", "http://2.bp.blogspot.com/-ujddJNQ7hBU/T6LKuxhQsLI/AAAAAAAAFNU/RwdvAUH-D7c/s1600/mountains-wallpaper-6.jpg");
  },

  removeImage: function() {
    this.set("image", null);
  }
});
