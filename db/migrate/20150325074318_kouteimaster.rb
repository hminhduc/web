class Kouteimaster < ActiveRecord::Migration
  def change
    create_table :工程マスタ do |t|
      t.string :所属コード
      t.string :工程コード
      t.string :工程名
      t.timestamps null: false
    end
  end
end
