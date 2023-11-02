class CreateVacations < ActiveRecord::Migration[6.1]
  def change
    create_table :vacations do |t|
      t.string :name
      t.string :date
      t.string :price
      t.string :place
      t.string :people

      t.timestamps
    end
  end
end
