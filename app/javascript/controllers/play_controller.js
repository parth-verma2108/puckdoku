import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="test"
export default class extends Controller {
  static targets = ["nba_player"]
  static values = { player: {type: Number, default: 0} }


  connect() {
    console.log("Connecting Players....")
  }

  showPlayerName(){
    console.log("Print body", this.playerValue)
  }

  highlight(){
    this.element.classList.add('highlight')
  }

  removeHighlight(){
    this.element.classList.remove('highlight')
  }
}
