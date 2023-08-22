class NhlPlayer < ApplicationRecord
  has_many :selected_blocks, class_name: 'Coordinate', foreign_key: 'nhl_player_id'

  has_many :team_players
  has_many :associated_teams, through: :team_players, source: :nhl_team
end
