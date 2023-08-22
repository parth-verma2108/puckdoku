class NhlTeam < ApplicationRecord
  validates_presence_of :name

  has_many :team_players
  has_many :associated_players, through: :team_players, source: :nhl_player
end
