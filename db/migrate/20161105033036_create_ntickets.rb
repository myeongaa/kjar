class CreateNtickets < ActiveRecord::Migration
  def change
    create_table :ntickets do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :user_name
      t.string :user_phone
      t.integer :ticketnumber
      t.timestamps null: false
    end
  end
end
