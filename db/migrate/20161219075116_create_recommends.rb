class CreateRecommends < ActiveRecord::Migration
  def change
    create_table :recommends do |t|
      t.string :name
      t.string :lat
      t.string :lng
      t.integer :re_runtime, default:"0"
      t.timestamps null: false
    end
  end
end
