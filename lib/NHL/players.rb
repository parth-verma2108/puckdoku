class NHL::Players
  attr_reader :team_id, :player_id

  def initialize(team, player)
    @team_id = team
    @player_id = player
  end

  def retrieve
    team_players = HTTParty.get("https://statsapi.web.nhl.com/api/v1/teams/#{team_id}/roster")
    team_players['roster']
  end

  def get_birth_year
    player_details = HTTParty.get("https://statsapi.web.nhl.com/api/v1/people/#{player_id}")
    player_details['people'].first['birthDate'].to_date.year
  end
end