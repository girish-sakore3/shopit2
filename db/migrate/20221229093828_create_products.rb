class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :url
      t.float :price
      t.string :description
      t.string :features

      t.timestamps
    end
  end
end
