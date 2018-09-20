class RemoveNameFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :nickname, :string
  end
end
