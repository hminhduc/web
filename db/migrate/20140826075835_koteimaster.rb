class Koteimaster < ActiveRecord::Migration
  def change
      create_table :工程マスタ do |t|
      t.string :分類
      t.string :コード
      t.string :工程名
      t.timestamps
    end
  end
end
