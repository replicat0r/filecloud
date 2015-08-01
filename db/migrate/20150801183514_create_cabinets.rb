class CreateCabinets < ActiveRecord::Migration
  def change
    create_table :cabinets do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
