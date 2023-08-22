class CreateNhlPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :nhl_players do |t|
      t.string :first_name
      t.string :last_name
      t.date :from
      t.date :to
      t.integer :stats
      t.string :avatar

      t.timestamps
    end
  end
end
