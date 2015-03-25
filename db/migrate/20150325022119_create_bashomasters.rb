class CreateBashomasters < ActiveRecord::Migration
  def change
    create_table :場所マスタ do |t|
      t.string :社員番号
      t.string :場所コード
      t.string :場所名
      t.string :場所名カナ
      t.string :SUB
      t.string :場所区分
      t.string :会社コード
      t.timestamps null: false
    end
  end
end
