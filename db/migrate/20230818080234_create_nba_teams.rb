class CreateNbaTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :nba_teams do |t|
      t.string :name
      t.string :avatar

      t.timestamps
    end
  end
end
