Yakushoku.delete_all
Yakushoku.reset_pk_sequence

5.times do |i|
  Yakushoku.create!(
      {役職コード:"000000000#{i}",役職名: "役職名#{i}"}
  )
end