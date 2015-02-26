class CreateEmployer < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.timestamps
    end
  end
end