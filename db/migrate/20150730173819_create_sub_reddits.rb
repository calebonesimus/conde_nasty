class CreateSubReddits < ActiveRecord::Migration
  def change
    create_table :sub_reddits do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
