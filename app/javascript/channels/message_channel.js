import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
      const html =
      `<p class = "com"><a>さん</a>
      <a>:</a>${data.content.text},
      ${data.content.user_nickname}
      `;
      const messages = document.getElementById('messages');
      const newMessage = document.getElementById('message_text');
      messages.insertAdjacentHTML('afterbegin', html);
      newMessage.value='';
  }
});
