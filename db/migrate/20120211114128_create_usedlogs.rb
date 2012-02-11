class CreateUsedlogs < ActiveRecord::Migration
  def change
    create_table :usedlogs do |t|
      t.string :screen_name
      t.text :profile

      t.timestamps
    end
  end
end
