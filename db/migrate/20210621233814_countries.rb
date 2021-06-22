class Countries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :countries_name
      t.timestamps null: false
    end
  end
end
