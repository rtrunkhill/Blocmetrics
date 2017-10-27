class CreateRegisterApps < ActiveRecord::Migration
  def change
    create_table :register_apps do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
