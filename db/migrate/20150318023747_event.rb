class Event < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
