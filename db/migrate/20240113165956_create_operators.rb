class CreateOperators < ActiveRecord::Migration[7.0]
  def change
    create_table :operators do |t|
      t.string :name, null: false #名前
      t.string :password_digest, null: false #パスワード
      t.timestamps
    end
  end
end
