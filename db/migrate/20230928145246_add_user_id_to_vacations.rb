class AddUserIdToVacations < ActiveRecord::Migration[6.1]
  def change
    add_column :vacations, :user_id, :integer
  end
end
