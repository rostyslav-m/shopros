class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :msg
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :products
  end
end
