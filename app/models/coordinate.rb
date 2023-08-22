class Coordinate < ApplicationRecord
  belongs_to :game
  belongs_to :nba_player
end
