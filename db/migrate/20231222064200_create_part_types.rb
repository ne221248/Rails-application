class CreatePartTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :part_types do |t|
      t.string :type, null:false #GPU,CPU等
      t.timestamps
    end
  end
end
