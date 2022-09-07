class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :self_introduction, :text
    add_column :users, :profile_image_id, :string
    add_column :users, :is_deleted, :boolean, default: false, null: false
  end
end
