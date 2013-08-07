class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.text :name, null:false
      t.text :type
      t.text :detail
      t.timestamps
    end
  end
end
