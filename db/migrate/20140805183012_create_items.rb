class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :category_id
      t.string :title
      t.string :inventory
      t.integer :price
    end
  end
end
