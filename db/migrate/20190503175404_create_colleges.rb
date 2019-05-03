class CreateColleges < ActiveRecord::Migration[5.1]
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :code
      t.string :address
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
