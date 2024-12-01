class CreateNotaries < ActiveRecord::Migration[7.2]
  def change
    create_table :notaries do |t|
      t.string :name

      t.timestamps
    end
  end
end
