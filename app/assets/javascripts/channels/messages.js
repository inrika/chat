App.messages = App.cable.subscriptions.create( "MessagesChannel",{
  connected: function(){
    //# Called when the subscription is ready for use on the server
  },
  disconnected: function(){
    //# Called when the subscription has been terminated by the server
  },
  received: function(data) {
    $("#messages").removeClass('hidden')
    return $("#messages").append(data.message);
  },

 });

  $(document).on('turbolinks:load', function() {
    $(".pre-scrollable").scrollTop = 9999;
      $("#message_body").keydown(function (event) {
      if (event.which == 13) {
        var msg = event.target.value
        var roomId = $("[data-room]").data().room
        App.messages.send({message:msg, room_id: roomId})
        $("#message_body").val(" ")
        var scroll = $(".pre-scrollable");
        scroll.scrollTop(scroll.prop('scrollHeight'));
        return false;
        }
      });
      $(".send_message").on ("click",function(){
        var msg = $("#message_body").val()
        var roomId = $("[data-room]").data().room
        App.messages.send({message:msg, room_id: roomId})
        $("#message_body").val(" ")
        var scroll = $(".pre-scrollable");
        scroll.scrollTop(scroll.prop('scrollHeight')+10);
        return false;
      })

  });
