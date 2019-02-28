class AddUsernameToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :string, :string
  end
end
