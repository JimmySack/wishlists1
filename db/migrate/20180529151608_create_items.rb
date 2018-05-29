class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.string :link
      t.integer :wishlist_id

      t.timestamps

    end
  end
end
