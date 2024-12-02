class CreateProperties < ActiveRecord::Migration[7.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :external_id
      t.string :erp_code

      t.timestamps
    end
  end
end
