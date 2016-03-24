class AddImageDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_image_size, :integer
    add_column :users, :user_image_content_type, :string
  end
end
