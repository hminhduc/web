class BaseController < ApplicationController

  protect_from_forgery
  # before_filter :login_required

  def login_required
    tantocode = session[:tantocode]
      if tantocode.nil? then
        redirect_to :controller=>'login', :action => 'index'
      end
  end
  
  def get_version
     'ver.1.00.00'
  end
  
 def get_page_title(program_id, screen_name, tantoname, user, dbserver)
  return "#{program_id}  #{screen_name}  ( #{get_version})-[#{tantoname}]-[#{user}@#{dbserver}]"
 end
 
 def page_size
   15
 end

end