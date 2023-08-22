class CreateNbaPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :nba_players do |t|
      t.string :first_name
      t.string :last_name
      t.date :from
      t.date :to
      t.integer :stats
      t.string :avatar
      t.references :nba_team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
