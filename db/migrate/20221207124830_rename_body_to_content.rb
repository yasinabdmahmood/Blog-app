class RenameBodyToContent < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :CommnetsCounter, :CommentsCounter
  end
end
