class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
  end

  def login
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  # def edit
  # end

  # POST /users
  # POST /users.json
  def create
    case params[:commit]
      when 'Create'
        @user = User.new(user_params)
        respond_to do |format|
          if @user.save
            Rails.logger.info 'User created'
            format.html { redirect_to login_users_url, notice: '新規成功出来ました。' }
          else
            Rails.logger.info 'User uncreated'
            format.html { render 'new' }
            # format.json { render json: @user.errors, status: :unprocessable_entity }
            # format.js { render json: @user.errors, status: :unprocessable_entity }
            # format.js { render 'show' }
          end
        end
      when 'Sign in'
        @user = User.where('担当者コード = ? AND パスワード = ?',params[:user][:担当者コード].downcase,params[:user][:パスワード]).first

        respond_to do |format|
          if @user.nil?
            Rails.logger.info 'login unsuccess'
            flash.now[:notice] = "社員番号とパスワードを正しく入力してください。"
            # Create an error message and re-render the signin form.
            format.html {render action: 'login', notice: 'unsuccess'}
          else
            # Sign the user in and redirect to the user's show page.
            Rails.logger.info 'login success'
            # format.html { redirect_to main_shozais_url }
            session['user'] = @user.担当者名称
            format.html { redirect_to atops_url }
          end
        end
    end
    # @user = User.new(user_params)

    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @user }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def change_pass

  end

  def change_pass_exc
    @user = User.find_by(担当者コード: params[:user][:担当者コード].downcase,パスワード: params[:user][:パスワード])
    if !@user.nil?
      if params[:user][:新パスワード] == params[:user][:もう一度新パスワード]
        @user.update(パスワード: params[:user][:新パスワード])
        redirect_to root_url
      else
        flash.now[:error] = '新パスワードともう一度パスワードが異なります。'
        render 'change_pass'
      end
    else
      respond_to do |format|
        format.html {redirect_to action: 'change_pass'}
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:担当者コード, :担当者名称, :パスワード)
  end
end
