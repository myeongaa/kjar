class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string  :name
      t.string :c_postcode
      t.string :c_address
      t.string :c_daddress
      t.string :tel
      t.string :opentime
      t.string :closetime
      t.integer :csort_id
      t.integer :openclose , default:"1"
      t.integer :nticket_max , default:"1"
      t.integer :runtime, default:"0"
      t.timestamps null: false
    end
  end
end
