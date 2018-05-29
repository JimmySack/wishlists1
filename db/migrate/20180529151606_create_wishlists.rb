class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :name
      t.date :date
      t.integer :user_id

      t.timestamps

    end
  end
end
