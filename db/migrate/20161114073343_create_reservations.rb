class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :reserve_time
      t.string :reserve_date
      t.string :requestmenu
      t.integer :person_num
      t.integer :confirm_num ,default:"1"
      t.string :comment
      t.timestamps null: false
    end
  end
end
