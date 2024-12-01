class CreatePropertyNotaries < ActiveRecord::Migration[7.2]
  def change
    create_table :property_notaries do |t|
      t.references :notary, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
