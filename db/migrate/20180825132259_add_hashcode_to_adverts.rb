class AddHashcodeToAdverts < ActiveRecord::Migration[5.2]
  def change
    add_column :adverts, :hashcode, :string
  end
end
