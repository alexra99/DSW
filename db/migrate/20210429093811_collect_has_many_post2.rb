class CollectHasManyPost2 < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :posts, :collects
  end
end
