// chat.init('#chat-div')
var chat = (function(){
  // Returns timestamp in milliseconds
  var timeNow = function(){
    return new Date().getTime();
  };
  // Makes divs for the individual chat lines
  var chatLine = function(args){
    return $('<div>'+args.name+': '+args.text+'</div>')
  };
  // Initialize parts of chat area
  var chatBox = $("<div id='chatBox'></div>");
  var input = $("<input type='text' placeholder='Chat!'>");
  var submit = $("<input type='submit' value='Submit'>");
  // Makes AJAX call and sets event listeners
  var init = function(target){
    // Add the parts of the chat area
    $(target).append(chatBox, input, submit);
    // AJAX call to get user data
    $.get('/user_data').done(function(user){
      var families = "https://dazzling-fire-1448.firebaseio.com/families/"
      // Firebase client
      var fb = new Firebase(families+user.uid+"/chat");
      // Listens for DB changes and refreshes the chat canvas
      fb.on('value', function(snap){
        chatBox.html('');
        $.each(snap.val(),function(time,line){
          chatBox.append(chatLine(line))
        });
      });
      // Listens for clicks on the submit button
      submit.on('click',function(){
        fb.child(timeNow()).set({
          name: user.name,
          text: input.val()
        });
        input.val('');
      });
    });
  };
  return {
    init: init,
  };
})();

// map.init('map-canvas')
var map = (function(){
  // Runs the calls to FB and sets markers
  var setMarkers = function(map,coords) {
    // AJAX to get user data
    $.get('/user_data').done(function(user){
      var family = "https://dazzling-fire-1448.firebaseio.com/families/"\
      // Set FB ref
      var ref = new Firebase(family+user.uid+"/locations");
      ref.child(user.name).set(coords);
      // Save markers for deletion
      var markers = [];
      // Listen for db changes and set markers
      ref.on('value', function(snap){
        // Delete all current markers
        for(var i = 0; i < markers.length; i++){
          markers[i].setMap(null)
        };
        markers = [];
        // Iterate through all family locations
        $.each(snap.val(),function(name,latlng){
          // Create marker
          var marker = new google.maps.Marker({
            position: latlng,
            map: map,
            title: name
          });
          // Add to markers array
          markers.push(marker)
          // Init info window
          var infowindow = new google.maps.InfoWindow({
            content: '<div>'+name+'</div>'
          });
          // Add info window to marker
          google.maps.event.addListener(marker, 'click', function(){
            infowindow.open(map,marker);
          });
        });
      });
    });
  };
  var init = function(target){
    // Start cascade with getting location from client's browser
    navigator.geolocation.getCurrentPosition(function(position){
      // Save coords
      var coords = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      // Save mapOptions
      var mapOptions = {
        center: coords,
        zoom: 13
      };
      // Initialize map
      var map = new google.maps.Map(document.getElementById(target), mapOptions);
      // When map is loaded, make DB query and add markers
      google.maps.event.addListener(map,'tilesloaded', function(){
        setMarkers(map,coords);
      });
    });
  };
  return {
    init: init
  };
})();