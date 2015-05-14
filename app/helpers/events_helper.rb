module EventsHelper
  def get_shozoku(shainbango)
    shain = Shainmaster.find_by 連携用社員番号: shainbango
    shozoku_code = shain.try(:所属コード)
    shozoku = Shozokumaster.find_by 所属コード: shozoku_code
    return shozoku.try(:所属名)
  end
end
