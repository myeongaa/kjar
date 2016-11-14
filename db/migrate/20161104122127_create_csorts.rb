class CreateCsorts < ActiveRecord::Migration
  def change
    create_table :csorts do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
