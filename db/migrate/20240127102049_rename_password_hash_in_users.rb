class RenamePasswordHashInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :password_hash, :password_digest
  end
end
