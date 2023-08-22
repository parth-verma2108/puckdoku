class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.time :begin
      t.time :end
      t.boolean :expired, default: false
      t.boolean :unlimited, default: false
      t.integer :shots, :default => Game::SHOTS
      t.integer :shots_played
      t.datetime :played_on
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
