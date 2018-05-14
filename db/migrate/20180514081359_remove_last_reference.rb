class RemoveLastReference < ActiveRecord::Migration[5.1]
  def change
    remove_reference :registered_applications, :users, foreign_key: true
  end
end
