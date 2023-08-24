class PlayController < ApplicationController
  def index
    if params[:query].present?
      sql = "SELECT * FROM nhl_players WHERE LOWER(name) LIKE LOWER('%#{params[:query]}%');"
      @players = ActiveRecord::Base.connection.execute(sql)

      # @players = NhlPlayer.where('name ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.json { render json: { players: @players.to_a } }
      format.js
    end
  end

  def correct_player?
    is_correct_player = false
    player = NhlPlayer.find_by(name: params[:player_name])
    associated_teams = player.associated_teams

    teams = params.fetch(:teams, []).split('-')

    team_1 = NhlTeam.find_by(abbreviation: teams[0])
    team_2 = NhlTeam.find_by(abbreviation: teams[1])

    is_correct_player = true if associated_teams.include?(team_1) || associated_teams.include?(team_2)

    respond_to do |format|
      format.html
      format.json { render json: { is_correct_player: is_correct_player, player: player } }
      format.js
    end

  end
end
