class AddSportToClubs < ActiveRecord::Migration[5.2]
  def change
    add_reference :clubs, :sport
  end
end
