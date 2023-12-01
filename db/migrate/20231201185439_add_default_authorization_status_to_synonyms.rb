class AddDefaultAuthorizationStatusToSynonyms < ActiveRecord::Migration[7.0]
  def change
    change_column :synonyms, :authorization_status, :integer, default: 0
  end
end
