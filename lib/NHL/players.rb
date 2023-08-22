class NHL::Players
  attr_reader :team_id

  def initialize(team)
    @team_id = team
  end

  def retrieve
    team_players = HTTParty.get("https://statsapi.web.nhl.com/api/v1/teams/#{team_id}/roster")
    team_players['roster']
  end
end