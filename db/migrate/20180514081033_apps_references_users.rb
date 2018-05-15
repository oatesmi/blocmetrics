class AppsReferencesUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :registered_applications, :users, foreign_key: true
  end
end
