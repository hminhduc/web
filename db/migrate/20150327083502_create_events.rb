class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :社員番号
      t.date :日付
      t.string :開始時刻
      t.string :終了時刻
      t.string :状態コード
      t.string :場所コード
      t.string :JOB
      t.string :工程コード
      t.string :工数
      t.string :計上
      t.timestamps null: false
    end
  end
end
