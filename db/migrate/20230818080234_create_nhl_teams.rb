class CreateNhlTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :nhl_teams do |t|
      t.string :name
      t.string :abbreviation
      t.string :avatar

      t.timestamps
    end
  end
end
