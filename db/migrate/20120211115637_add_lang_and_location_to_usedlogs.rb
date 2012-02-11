class AddLangAndLocationToUsedlogs < ActiveRecord::Migration
  def change
    add_column(:usedlogs, :lang, :string)
    add_column(:usedlogs, :location, :string)

  end
end
