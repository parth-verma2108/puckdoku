class CreateTeamPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :team_players do |t|
      t.references :nhl_team, null: false, foreign_key: true
      t.references :nhl_player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
