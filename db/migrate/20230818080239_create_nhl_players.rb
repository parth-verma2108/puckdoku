class CreateNhlPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :nhl_players do |t|
      t.string :name
      t.integer :from
      t.integer :to
      t.integer :stats
      t.string :avatar

      t.timestamps
    end
  end
end
