class CreateColleges < ActiveRecord::Migration[5.1]
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :code
      t.string :address
      t.string :state
      t.string :district
      t.integer :country_id
      t.integer :university_id

      t.timestamps
    end
  end
end
