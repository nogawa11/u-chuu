import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

window.addEventListener("turbolinks:load", () => {
  hideNotice();
});

function hideNotice() {
  const notification = document.querySelector('.alert')
  if (notification) {
    setInterval(function() {
      notification.classList.add('fadeout');
    }, 5000);
  }
}
