class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :home_club, foreign_key: {to_table: :clubs}
      t.references :away_club, foreign_key: {to_table: :clubs}
      t.date :date

      t.timestamps
    end
  end
end
