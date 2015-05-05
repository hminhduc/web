class CreateShozoku < ActiveRecord::Migration
  def change
    create_table :所属マスタ do |t|
      t.string :所属コード
      t.string :所属名
      t.timestamps null: false
    end
  end
end
