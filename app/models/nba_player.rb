class NbaPlayer < ApplicationRecord
  belongs_to :nba_team

  has_many :selected_blocks, class_name: 'Coordinate', foreign_key: 'nba_player_id'
end
