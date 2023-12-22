class CreateConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :configurations do |t|
      t.references :plan, null: false #外部キー
      t.references :part, null: false #外部キー
      t.references :cart #外部キー
      t.references :order #外部キー

      t.timestamps
    end
  end
end
