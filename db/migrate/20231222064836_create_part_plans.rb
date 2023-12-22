class CreatePartPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :part_plans do |t|
      t.references :part, null: false #外部キー
      t.references :plan, null: false #外部キー
      t.timestamps
    end
  end
end
