import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // alert("Connected!!");

    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {

    // console.log("Received data")
    // alert('Recieved');
    // alert(data.mod_msg);


    $('#message-container').append(data.mod_msg);
    // scroll_bottom();
    // Called when there's incoming data on the websocket for this channel
  }
});
