import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ 'text' ]

  connect() {
    console.log('Hello from home_controller.js')
    // console.log(this.testTarget)
  }

  typingEffect() {
    var text = this.textTarget;

    var typewriter = new Typewriter(text, {
        loop: true
    });

    typewriter.typeString('Hello World!')
        .pauseFor(2500)
        .deleteAll()
        .typeString('Strings can be removed')
        .pauseFor(2500)
        .deleteChars(7)
        .typeString('<strong>altered!</strong>')
        .pauseFor(2500)
        .start();
  }
}
