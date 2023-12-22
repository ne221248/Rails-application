class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :member, null: false #メンバーの外部キー
      t.string :status, null: false #予約、作製中、発送済み
      t.integer :amount, null: false #金額
      t.timestamps
    end
  end
end
