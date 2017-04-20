class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price_in_cents
      t.integer :user_id

      t.timestamps
    end
  end
end
