class AddAdminIdToShelters < ActiveRecord::Migration[6.0]
  def change
    add_column :shelters, :admin_id, :integer
  end
end
