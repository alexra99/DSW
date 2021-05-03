class AddExtensionToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :extension, :string
  end
end
