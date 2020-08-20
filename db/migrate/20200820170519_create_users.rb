class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :email
      t.string :country_code
      t.integer :phone
      t.timestamps
    end
  end
end
