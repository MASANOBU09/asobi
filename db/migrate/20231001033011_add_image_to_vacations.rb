class AddImageToVacations < ActiveRecord::Migration[6.1]
  def change
    add_column :vacations, :image, :string
  end
end
