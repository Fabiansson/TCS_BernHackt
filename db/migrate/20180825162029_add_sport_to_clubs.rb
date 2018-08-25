class AddSportToClubs < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :clubs, :sport
  end
end
