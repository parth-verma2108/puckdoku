class NbaTeam < ApplicationRecord
  validates_presence_of :name, :from, :to
end
