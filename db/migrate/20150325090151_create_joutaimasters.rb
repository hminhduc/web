class CreateJoutaimasters < ActiveRecord::Migration
  def change
    create_table :状態マスタ do |t|
      t.string :状態コード
      t.string :状態名
      t.string :状態区分
      t.string :勤怠状態名
      t.string :マーク
      t.string :色
      t.string :WEB使用区分
      t.string :勤怠使用区分

      t.timestamps null: false
    end
  end
end
