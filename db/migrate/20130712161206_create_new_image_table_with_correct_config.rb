class CreateNewImageTableWithCorrectConfig < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :works
      t.has_attached_file :file
      t.timestamps
    end
  end
end
