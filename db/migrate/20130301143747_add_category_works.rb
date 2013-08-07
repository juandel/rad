class AddCategoryWorks < ActiveRecord::Migration
  def up
    rename_column :works, :type, :category
  end

  def down
    rename_column :works, :category, :type
  end
end
