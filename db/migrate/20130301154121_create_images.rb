class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :works
      t.attachment :file
      t.timestamps
    end
  end
end
