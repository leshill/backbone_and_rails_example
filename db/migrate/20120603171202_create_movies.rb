class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.float :opening_weekend
      t.float :percent_of_total
      t.float :total_gross

      t.timestamps
    end
  end
end
