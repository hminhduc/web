require 'login/user_controller_model.rb'
# class User::LoginController < BaseController
class LoginController < BaseController
  # include UserControllerModel
  
  def index
    program_id = 'jpt_001'
    screen_name = 'Login'
    tantoname   = '***' if tantoname.nil?
    @page_title = get_page_title(program_id,screen_name,tantoname, Constant.user_name, Constant.server_name)
    @records = UserControllerModel.get_all

    if request.post?
      #フォームにタントウコードを取得する。
      tantocode = params[:tantocode]
      tantopwd = params[:password]

      # Check length
      # if tantocode.length > 10
      #   redirect_to action: 'index', tid: tantocode, message: '担当者コードまたはパスワードに誤りがあります。'
      #   return
      # end

      # Check blank included
      tantocode.each_byte do |x|
        if x == 32
          # redirect_to action: 'index', tid: tantocode, message: '担当者コードまたはパスワードに誤りがあります。'
          @message = '担当者コードまたはパスワードに誤りがあります。'
          redirect_to action: 'index'
          return
        end
      end

      #データの担当者を取得する。
      tanto = UserControllerModel.get_tanto_login(tantocode, tantopwd)

      # if !tanto['担当者コード'].nil?
      if !tanto.empty?
        # ログインが成功
        session[:tantoname] = tanto['担当者名称'] 
        session[:tantocode] = tanto['担当者コード'] 
        redirect_to controller: 'main001', action: 'index'
      else
        #データの担当者が無理。
        session['tantoname'] = ''
        session['tantocode'] = nil
        # @message = '担当者コードまたはパスワードに誤りがあります。'
        # redirect_to controller: 'login', action: 'index'
        redirect_to action: 'index', message: '担当者コードまたはパスワードに誤りがあります。'
      end
    end
  end

  def edit
    @program_id = 'jpt_002'
    @screen_name = 'ログイン情報編集'

  	@message = nil    
    @page_title = get_page_title(@program_id,@screen_name,session[:tantoname], Constant.user_name, Constant.server_name)

    if request.post?
      # param            = params[:pass_change]
      tantocode        = params[:tantocode]
      # tantoname        = params[:tantoname]
      password         = params[:password]
      new_pass         = params[:newpassword]
      confirm_new_pass = params[:newpasswordconfirm]
      
      respond_to do |format|
        if new_pass == confirm_new_pass && !tantocode.nil?
          if UserControllerModel.search_by_id(tantocode) == '0'
            Rails.logger.info 'Update doing 担当者マスタ...'
            UserControllerModel.update_user(tantocode,new_pass)
          # else
          #   Rails.logger.info 'Insert doing　担当者マスタ...'
          #   UserControllerModel.insert_user(tantocode,tantoname,password)
          end
          @message = 'パスワードの変更に成功しました。'
          @flag = true
          format.html{render action: 'edit'}
        else
          @message = 'パスワードの変更に誤りがあります。'
          @flag = false
          format.html{render action: 'edit'}
        end
      end
    end  
  end

  def logon
    #フォームにタントウコードを取得する。
    tantocode = params[:user][:tantocode]
    tantopwd = params[:user][:password]

    # Check length
    # if tantocode.length > 10
    #   redirect_to action: 'index', tid: tantocode, message: '担当者コードまたはパスワードに誤りがあります。'
    #   return
    # end

    # Check blank included
    tantocode.each_byte do |x|
    	if x == 32
        redirect_to action: 'index', tid: tantocode, message: '担当者コードまたはパスワードに誤りがあります。'
        return
    	end
    end

    #データの担当者を取得する。
    tanto = UserControllerModel.get_tanto_login(tantocode, tantopwd)

    if tanto['担当者コード'].nil?
      #データの担当者が無理。
      session['tantoname'] = ''
      session['tantocode'] = nil
      redirect_to action: 'index', tid: tantocode, message: '担当者コードまたはパスワードに誤りがあります。'
    else
      # ログインが成功
      session[:tantoname] = tanto['担当者名称'] 
      session[:tantocode] = tanto['担当者コード'] 
      redirect_to controller: 'main001', action: 'index'
    end
  end

  def logout
  	session[:tantoname] = ''
  	session[:tantocode] = ''
  	redirect_to action: 'index'
  end

  def destroy
  	session[:tantoname] = nil
  end

  def year
    @program_id = 'jpt_003'
    @screen_name ='支給年度選択'
    @page_title = get_page_title(@program_id,@screen_name,session[:tantoname], Constant.user_name, Constant.server_name)

    if request.post?
      year = params[:select_year][:year]
      month = params[:select_year][:month]

      record = SalaryControllerModel.searchbyid(session[:tantocode].strip,year,month)

      if !record['社員番号'].nil?
        session[:year] = year
        session[:month] = month
        redirect_to controller: 'salary', action: 'detail'
      else
        respond_to do |format|
          @message = '支給年度または支給月が存在していません。'
          format.html{render action: 'year'}
        end
      end
    end

  end

end