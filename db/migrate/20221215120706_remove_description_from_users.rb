class RemoveDescriptionFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :description, :string
  end
end
