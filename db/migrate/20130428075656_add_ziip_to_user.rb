class AddZiipToUser < ActiveRecord::Migration
  def change
    add_column :users, :ziip, :string
  end
end
