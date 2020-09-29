class AddTestTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :test_token, :string
  end
end
