module Constant
  
  @config   = Rails.configuration.database_configuration

  def self.user_name
    return @config[Rails.env]["username"];
  end
    
  def self.server_name
    return @config[Rails.env]["database"];
  end
    
end