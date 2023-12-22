class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :member, null: false #外部キー

      t.timestamps
    end
  end
end
