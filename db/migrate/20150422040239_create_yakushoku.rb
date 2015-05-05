class CreateYakushoku < ActiveRecord::Migration
  def change
    create_table :役職テープル do |t|
      t.string :役職コード
      t.string :役職名
      t.timestamps null: false
    end
  end
end
