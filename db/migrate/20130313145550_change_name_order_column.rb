class ChangeNameOrderColumn < ActiveRecord::Migration
  def up
    rename_column :works, :order, :order_work_by 
  end

  def down
    rename_column :works, :order_work_by, :order 
  end
end
