var Place = Ember.Object.extend({
  name: null,
  image: null,

  country: null,
  state: null,
  city: null,
  street: null,
  gps: null,

  tags: null,

  isScenic: false,
  isHistoric: false,
  isCultural: false,

  author: null,

  imageBackgroundStyle: function() {
    return 'background-image: url(' + this.get('image') + ')';
  }.property('image'),

  locationSummary: function() {
    var country = this.get("country");
    var state = this.get("state");

    if (state) state = ', ' + state;

    return (country + state) || '&nbsp;';
  }.property('country', 'state')
});

Place.reopenClass({
  findAll: function() {
    var places = [];
    var Place = Parse.Object.extend("Place");
    var query = new Parse.Query(Place);

    query.limit(10);

    return query.find({
      success: function(results) {
        for (var i=0; i < results.length; i++) {
          places.push(App.Place.create({
            name: results[i].get("name"),
            image: results[i].get("image"),
            country: results[i].get("country"),
            state: results[i].get("state"),
            city: results[i].get("city"),
            street: results[i].get("street"),
            gps: results[i].get("gps"),
            tags: results[i].get("tags"),
            isScenic: results[i].get("isScenic"),
            isHistoric: results[i].get("isHistoric"),
            isCultural: results[i].get("isCultural")
          }));
        }
      },
      error: function(error) {
        console.log("Error: " + error.code + " " + error.message);
      }
    }).then(function() {
      return places;
    })
  }
});
