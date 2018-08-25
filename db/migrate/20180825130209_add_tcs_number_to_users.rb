class AddTcsNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tcs_number, :string
  end
end
