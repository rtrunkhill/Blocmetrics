class AddUserIdToRegisterApps < ActiveRecord::Migration
  def change
    add_column :register_apps, :user_id, :integar
  end
end
