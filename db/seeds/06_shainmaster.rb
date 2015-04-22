Shainmaster.delete_all
Shainmaster.reset_pk_sequence

5.times do |i|
Shainmaster.create!(
                  {社員番号:"000000000#{i}",連携用社員番号: '0123456789', 氏名: "name#{i}", 所属コード: '0123456789', 直間区分:'1', 役職コード:'0123456789'}
              )
end