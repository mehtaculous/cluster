class AddUnitSizeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :unit_size, :string
  end
end
