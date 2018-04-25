App.messages = App.cable.subscriptions.create( "MessagesChannel",{
  connected: function(){
    //# Called when the subscription is ready for use on the server
  },
  disconnected: function(){
    //# Called when the subscription has been terminated by the server
  },
  received: function(data) {

    return $("#messages").append(data.message);
    //return $("[data-chatroom='" + data.chatroom_id + "']").append(data.message);
  },

  renderMessage: function (data){

    return "<p> <b> "+data.user + " : </b>" + data.message + "</p>"
  }
 });

  $(document).on('turbolinks:load', function() {
    $("#message_body").keydown(function (event) {
      if (event.which == 13) {
        var msg = event.target.value
        var roomId = $("[data-room]").data().room
        App.messages.send({message:msg, room_id: roomId})
        $("#message_body").val(" ")
        return false;

        }
      });
      $(".send_message").on ("click",function(){
        var msg = $("#message_body").val()
        var roomId = $("[data-room]").data().room
        App.messages.send({message:msg, room_id: roomId})
        $("#message_body").val(" ")
        return false;
      })



  });
