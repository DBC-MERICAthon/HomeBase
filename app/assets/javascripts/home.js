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
      var fb = new Firebase(families+user.uid);
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

var m = (function(){
  var init = function(target){
    var mapOptions = {
      center: { lat: -34.397, lng: 150.644 },
      zoom: 13
    };
    var map = new google.maps.Map(document.getElementById(target), mapOptions);
    return map
  };
  return {
    init: init
  };
})();

$(function() {
  var map = m.init('map-canvas');
});
