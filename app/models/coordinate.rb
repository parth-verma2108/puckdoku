require 'matrix'

class Coordinate < ApplicationRecord
  TEAM_COORDINATES = Matrix[['DAL-SJS', 'DAL-NYR', 'DAL-SCW'], ['TBL-SJS', 'TBL-NYR', 'TBL-SCW'], ['PIT-SJS', 'PIT-NYR', 'PIT-SCW']]

  belongs_to :game
  belongs_to :nba_player
end
