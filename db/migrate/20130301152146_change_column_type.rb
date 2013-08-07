class ChangeColumnType < ActiveRecord::Migration
  def up
    change_column :works, :name, :string
    change_column :works, :category, :string
  end

  def down
    change_column :works, :name, :text
    change_column :works, :category, :text
  end
end
