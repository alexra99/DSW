class DeleteColumnImagepost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :img
  end
end
