class ChangeColumnTypePost < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :img, :string
  end
end
