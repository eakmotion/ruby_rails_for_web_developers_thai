class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :name
      t.date :time
      t.integer :sport_id

      t.timestamps
    end
  end
end
