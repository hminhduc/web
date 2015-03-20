class Kouteimaster < ActiveRecord::Migration
  def change
    create_table :JPT工程マスタ do |t|
      t.string :所属コード
      t.string :工程コード
      t.string :工程名
      t.timestamps
      end
  end
end
