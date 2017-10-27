class AddRegisterAppIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :register_app_id, :integer
  end
end
