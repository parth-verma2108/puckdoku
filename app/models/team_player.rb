class TeamPlayer < ApplicationRecord
  belongs_to :nhl_team
  belongs_to :nhl_player
end
