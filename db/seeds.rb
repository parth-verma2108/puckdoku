Rails.logger.info "Creating NBA teams..."

teams = NHL::Teams.new.retrieve

return 'Could not create NBA teams!!!' if teams.blank?

teams.each do |team|
  players = NHL::Players.new(team['id']).retrieve

  nhl_team = NhlTeam.create!(name: team['name'], abbreviation: team['abbreviation']) unless NhlTeam.find_by(name: team['name']).present?
end

Rails.logger.info "Creating NBA teams..."

