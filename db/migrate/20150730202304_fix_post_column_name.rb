class FixPostColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :link, :url
  end
end
