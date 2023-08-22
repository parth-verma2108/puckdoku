class CreateCoordinates < ActiveRecord::Migration[7.0]
  def change
    create_table :coordinates do |t|
      t.references :game, null: false, foreign_key: true
      t.string :dimension, array: true, default: []
      t.references :nhl_player, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
