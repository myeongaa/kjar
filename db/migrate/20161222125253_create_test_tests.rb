class CreateTestTests < ActiveRecord::Migration
  def change
    create_table :test_tests do |t|
      t.string :n

      t.timestamps null: false
    end
  end
end
