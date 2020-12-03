class AddArabRelativesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :arab_relatives, :boolean, default: false
  end
end
