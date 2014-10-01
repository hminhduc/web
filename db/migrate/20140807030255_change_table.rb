class ChangeTable < ActiveRecord::Migration
  def change
    create_table :担当者マスタ do |t|
      t.string :担当者コード
      t.string :担当者名称
      t.string :パスワード

      t.timestamps
    end
  end
end
