class AddUserToMiningType < ActiveRecord::Migration[5.2]
  def change
    add_reference :mining_types, :user, foreign_key: true
  end
end
