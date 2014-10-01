class Shozai < ActiveRecord::Migration
  def change
      create_table :所在マスタ do |t|
      t.string :所在コード
      t.string :所在名

      t.timestamps
    end

  end
end
