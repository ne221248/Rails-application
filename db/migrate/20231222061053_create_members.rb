class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name, null: false #ユーザー名
      t.string :mail, null: false #メールアドレス
      t.string :address, null: false #住所
      t.string :telephone, null: false #電話番号
      t.string :password_digest, null: false 
      t.timestamps
    end
  end
end