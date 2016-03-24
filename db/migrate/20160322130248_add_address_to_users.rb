class AddAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :add1, :string
    add_column :users, :street, :string
    add_column :users, :town, :string
    add_column :users, :country, :string
    add_column :users, :postcode, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
