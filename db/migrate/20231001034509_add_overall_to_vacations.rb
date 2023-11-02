class AddOverallToVacations < ActiveRecord::Migration[6.1]
  def change
    add_column :vacations, :overall, :integer
  end
end
