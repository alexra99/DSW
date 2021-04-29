class AddCollectIdToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :collect_id, :int
  end
end
