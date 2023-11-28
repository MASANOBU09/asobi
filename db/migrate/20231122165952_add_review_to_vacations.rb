class AddReviewToVacations < ActiveRecord::Migration[6.1]
  def change
    add_column :vacations, :review, :text
  end
end
