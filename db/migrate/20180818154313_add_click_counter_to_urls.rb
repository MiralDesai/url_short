class AddClickCounterToUrls < ActiveRecord::Migration[5.2]
  def change
    add_column :urls, :clicks, :integer, default: 0
  end
end
