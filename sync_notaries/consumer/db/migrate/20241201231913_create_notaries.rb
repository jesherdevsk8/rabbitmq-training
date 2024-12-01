class CreateNotaries < ActiveRecord::Migration[7.2]
  def change
    create_table :notaries, id: :uuid do |t|
      t.string :name
      t.integer :external_id
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
