import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="test"
export default class extends Controller {
  static targets = ["name"]
  static values = { player: {type: String, default: ''}, url: '/', playerName: String, playerId: Number, playerStatusUrl: '/correct_player' }


  connect() {
    console.log("Connecting Players....")
  }

  hideModal(){
    const modal = document.getElementsByClassName('modal')
    modal[0].classList.add('d-none')
    modal[0].classList.remove('d-block')
  }

  selectPlayer(){
    const modalTitle = document.getElementsByClassName('modal-title')
    const csrfToken = document.querySelector("[name='csrf-token']").content
    const selectButton = document.getElementsByClassName(`select-button-${this.playerIdValue}`)
    console.log("SELECTED", this.playerNameValue)

    fetch(`${this.playerStatusUrlValue}?player_name=${this.playerNameValue.toString()}&teams=${modalTitle.toString()}`, {
      method: "GET",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Accept": "application/json",
        "Content-Type": "application/json"
      }
    })
    .then(function(response) {
      return response.json();
    }).then(function(data) {
      console.log(data)
      if (data.is_correct_player){
        console.log("SUCCESS")
      }else{
        selectButton[0].classList.remove("btn", "btn-success", "text-white")
        selectButton[0].classList.add("text-danger")
        selectButton[0].innerHTML = "Incorrect"
        selectButton[0].classList.remove("select-button")
      }
    });
  }

  showPlayerName(){
    const input = this.nameTarget.value
    const playersList = document.getElementsByClassName('player-dropdown-menu')
    const csrfToken = document.querySelector("[name='csrf-token']").content

    fetch(`${this.urlValue}?query=${input.toString()}`, {
      method: "GET",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Accept": "application/json",
        "Content-Type": "application/json"
      }
    })
    .then(function(response) {
      return response.json();
    }).then(function(data) {
      const teamPlayers = data.players || []

      console.log(teamPlayers)
      playersList[0].innerHTML = "";

      if(teamPlayers?.length == 0){
        playersList[0].innerHTML = "<div class='flex my-3'>No player found</div>"
      }
      else{
        var i=0, len = teamPlayers.length
        while (i < len) {
          playersList[0].innerHTML += `<div id=${teamPlayers[i].id} class='d-flex my-3 position-relative'><div><div class='line-through'>${teamPlayers[i].name}</div><div class='text-xs font-light'>${teamPlayers[i].from}-${teamPlayers[i].to}</div></div><div class='btn btn-success shift-right text-white text-small select-button-${teamPlayers[i].id}' data-controller='play' data-action='click->play#selectPlayer' data-play-player-name-value='${teamPlayers[i].name}' data-play-player-id-value='${teamPlayers[i].id}'>Select</div></div>`
          i++
        }

        // <div class='shift-right text-danger text-medium'>Incorrect</div>
      }
    });

    if(input.length > 0){
      playersList[0].classList.add('d-block')
      playersList[0].classList.remove('d-none')
    } else {
      playersList[0].classList.add('d-none')
      playersList[0].classList.remove('d-block')
    }
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
