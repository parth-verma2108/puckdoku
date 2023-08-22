class Game < ApplicationRecord
  SHOTS = 9

  belongs_to :user
end
