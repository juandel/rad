class ChangeOrderType < ActiveRecord::Migration
  def up
    change_column    :works, :order, :integer
  end

  def down
    change_column    :works, :order, :number
  end
end
