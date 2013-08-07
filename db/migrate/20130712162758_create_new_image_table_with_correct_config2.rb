class CreateNewImageTableWithCorrectConfig2 < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :work
      t.has_attached_file :file
      t.timestamps
    end
  end
end
