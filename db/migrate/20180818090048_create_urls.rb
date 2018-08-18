class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :path
      t.string :short_path

      t.timestamps
    end
  end
end
