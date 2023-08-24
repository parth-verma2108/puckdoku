Rails.logger.info "Creating NBA teams..."

teams = NHL::Teams.new.retrieve

return 'Could not create NBA teams!!!' if teams.blank?

teams.each do |team|
  players = NHL::Players.new(team['id'], nil).retrieve

  nhl_team = NhlTeam.create!(name: team['name'], abbreviation: team['abbreviation']) unless NhlTeam.find_by(name: team['name']).present?

  next if players.blank? || nhl_team.errors.present?

  players.each do |player|
    birth_year = NHL::Players.new(nil, player['person']['id']).get_birth_year
    nhl_player = NhlPlayer.create!(name: player['person']['fullName'], from: birth_year, to: Date.current.year)

    TeamPlayer.create!(nhl_player: nhl_player, nhl_team: nhl_team)
  end
end

Rails.logger.info "Creating NBA teams..."

