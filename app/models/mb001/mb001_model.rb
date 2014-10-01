class Mb001Model

	attr_reader :担当グループコード, :担当グループ名称,	 :更新担当者コード,	:更新プログラム,	:更新日時, :入力日時

	attr_accessor :担当グループコード, :担当グループ名称,	 :更新担当者コード,	:更新プログラム,	:更新日時, :入力日時

	def puts(hashValue)
		@担当グループコード = hashValue['担当グループコード']
		@担当グループ名称 = hashValue['担当グループ名称']
		@更新担当者コード = hashValue['更新担当者コード']
		@更新プログラム = hashValue['更新プログラム']
		@更新日時 = hashValue['更新日時']
		@入力日時 = hashValue['入力日時']
	end

	def to_s
		v = to_array
		return "担当グループコード:#{v[0]}, 担当グループ名称:#{v[1]},	 更新担当者コード:#{v[2]},	更新プログラム:#{v[3]},	更新日時:#{v[4]}, 入力日時:#{v[5]}"
	end

	def to_array
		hash = []
		hash[0] = 担当グループコード
		hash[1] = 担当グループ名称
		hash[2] = 更新担当者コード
		hash[3] = 更新プログラム
		hash[4] = 更新日時
		hash[5] = 入力日時
		return hash
	end
end