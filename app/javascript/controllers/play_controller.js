import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="test"
export default class extends Controller {
  static targets = ["name"]
  static values = { player: {type: String, default: ''}, playerName: {type: String, default: ''} }


  connect() {
    console.log("Connecting Players....")
  }

  hideModal(){
    const modal = document.getElementsByClassName('modal')
    modal[0].classList.add('d-none')
    modal[0].classList.remove('d-block')
  }

  showPlayerName(){
    console.log("PAAA", this.playerNameValue)
  }

  showModal(){
    const modal = document.getElementsByClassName('modal')
    const modalTitle = document.getElementsByClassName('modal-title')
    modalTitle[0].innerHTML = this.playerValue
    modal[0].classList.add('d-block', 'blur-background')
    modal[0].classList.remove('d-none')
  }

  highlight(){
    this.element.classList.add('highlight')
  }

  removeHighlight(){
    this.element.classList.remove('highlight')
  }
}
