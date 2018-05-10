App.messages = App.cable.subscriptions.create( "MessagesChannel",{
  connected: function(){
    //# Called when the subscription is ready for use on the server
  },
  disconnected: function(){
    //# Called when the subscription has been terminated by the server
  },
  received: function(data) {
    var roomId = $("[data-room]").data().room
    if (roomId==data.room_id)
    {
      addToLocalStorage(data)
    }
    return $("[data-room='" + data.room_id + "']").append(data.message);
  },

 });

  $(document).on('turbolinks:load', function() {
    $("#message_body").keydown(function (event) {
      if (event.which == 13) {
        submitNewMessage();
      }
      });
      $(".send_message").on ("click",function(){
        submitNewMessage();
      })
  });

  function submitNewMessage(){
    var msg = $("#message_body").val()
    var roomId = $("[data-room]").data().room
    App.messages.send({message:msg, room_id: roomId})
    $("#message_body").val(" ")
    var scroll = $(".pre-scrollable");
    scroll.scrollTop(scroll.prop('scrollHeight')+10);
    return false;
  };

  function addToLocalStorage(data){
    var key = "room" + data.room_id;
    if (localStorage.getItem(key))
    {
      room = JSON.parse(localStorage.getItem(key));
    }
    else
    {
      room =[];
    }
    room.push(data.message);
    localStorage.setItem(key, JSON.stringify(room));

  };
