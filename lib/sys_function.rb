#!/bin/env ruby
# encoding: utf-8

class Sysfunction
  #================================================================
  #   名　称    Sysfunction
  #   説　明    common function
  #   補　足
  #   引　数 なし
  #   戻　値
  # (history)
  #   date         ver        name          comments
  #  -------     -----      ----------  -----------------
  #  2012.10.31  1.00.00     bdlong       fun
  #  2012.10.31  1.00.00     bdlong       新規作成
  #=================================================================
  @OracleHelper=nil
  
  def self.f_sys_get_grant( as_prog_id )
     #権限区分の取得
     @OracleHelper = OracleHelper.new();
     query = "SELECT F権限区分取得(#{as_prog_id}) AS 権限  FROM DUAL"
     rt_value=@OracleHelper.ExecuteSelectQueryOne(query)
     return rt_value['権限'];  
  end
  
end