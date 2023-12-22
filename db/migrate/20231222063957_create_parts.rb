class CreateParts < ActiveRecord::Migration[7.0]
  def change
    create_table :parts do |t|
      t.references :part_type, null: false #外部キー
      t.string :name, null: false #名前
      t.integer :price, null: false #価格
      t.string :group #intel or AMD(指定されている場合同じgroupのみを選択可能)
      t.integer :inventory, null: false #在庫
      t.timestamps
    end
  end
end
