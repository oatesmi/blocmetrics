class RemoveLastMigration < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, foreign_key: true
  end
end
