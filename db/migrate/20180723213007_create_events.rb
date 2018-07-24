class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.text :description
      t.references :location, index: true, foreign_key: true
      t.references :user

      t.timestamps null: false
    end
  end
end
