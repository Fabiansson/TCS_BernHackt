class CreateAdverts < ActiveRecord::Migration[5.2]
  def change
    create_table :adverts do |t|
      t.references :seasonpass, foreign_key: true
      t.references :game, foreign_key: true
      t.references :sold_to_user, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
