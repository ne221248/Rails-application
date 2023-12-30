class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name, null: false #名前
      t.string :description, null: false #プランの説明
      t.string :usertype, null: false #エントリー、ミドル、ハイエンド等
      t.integer :price, null: false #価格
      t.boolean :sale, null: false #構成を変更できるか
      t.timestamps
    end
  end
end
