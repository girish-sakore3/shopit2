class CreateOtps < ActiveRecord::Migration[7.0]
  def change
    create_table :otps do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :code

      t.timestamps
    end
  end
end
