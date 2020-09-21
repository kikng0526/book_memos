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
      `<p class = "com">${data.content.user_nickname}<a> さん</a>
      <a>:</a>${data.content.text}
      <i class="far fa-heart">${data.content.likes_count+0}</i>
      <i class="fas fa-trash-alt"></i></p>`;
      const messages = document.getElementById('messages');
      const newMessage = document.getElementById('comment_text');
      messages.insertAdjacentHTML('afterbegin', html);
      newMessage.value='';
  }
});
