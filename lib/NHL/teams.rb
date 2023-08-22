class NHL::Teams
  def retrieve
    nhl_teams = HTTParty.get('https://statsapi.web.nhl.com/api/v1/teams')
    nhl_teams['teams']
  end
end