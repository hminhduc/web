class Sagyou < ActiveRecord::Migration
  def change
      create_table :作業場所マスタ do |t|
      t.string :作業場所コード
      t.string :作業場所名
      t.timestamps

    end
  end
end
