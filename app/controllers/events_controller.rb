class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy]
  before_action :set_param, only: [ :create, :new, :show, :edit, :update, :destroy]

  helper EventsHelper
  
  def index
    # @events = Event.all
    @events = Event.binding_event_by_change_user(session['selected_user'])
    # @user = User.all
    @shains = Shainmaster.all
  end
  
  def edit

  end
  
  def new
    @event = Event.new
    @hash_param = { basho_name: '', koutei_name: '', joutai_name: '' }

  end
  
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        Rails.logger.info 'Event created'
        format.html { redirect_to events_url, notice: '新規成功出来ました。' }
      else
        Rails.logger.info 'Event uncreated'
        @hash_param = { basho_name: '', koutei_name: '', joutai_name: '' }
        format.html { render 'new' }
        # format.html { redirect_to new_event_url }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
        # format.js { render json: @user.errors, status: :unprocessable_entity }
        # format.js { render 'show' }
      end
    end
  end

  def update
    case params[:commit]
      when '　削除　'
        @event.destroy
        respond_to do |format|
          format.html { redirect_to events_url }
          format.json { head :no_content }
        end

      when '　登録　'
        respond_to do |format|
          if @event.update(event_params)
            format.html { redirect_to events_url, notice: '更新成功できました。' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
    end

  end
  
  def change_user
    # @events = Event.binding_event_by_change_user('1111')
    # @user = User.all
    session['selected_user'] = params[:selected_user]
    session['selected_user_name'] = params[:selected_user_name]
    
    respond_to do |format|
      format.html { redirect_to events_url}
      # format.html { render 'index'}
    end
  end
  
  def ajax
   case params[:id]
     when "event_状態コード"
       joutai = Joutaimaster.find_by 状態コード: params[:event_状態コード]
       joutai_name = joutai.try(:状態名)
       data = {joutai_name: joutai_name}
       respond_to do |format|
         format.json { render json: data}
       end
     when "event_場所コード"
       basho = Bashomaster.find_by 場所コード: params[:event_場所コード]
       basho_name = basho.try(:場所名)
       data = {basho_name: basho_name}
       respond_to do |format|
         format.json { render json: data}
       end
     when "event_工程コード"
       shain = Shainmaster.find_by 連携用社員番号: session['user_id']
       shozoku_code = shain.try(:所属コード)
       
       koutei = Kouteimaster.find_by 所属コード: shozoku_code, 工程コード: params[:event_工程コード]
       koutei_name = koutei.try(:工程名)
       
       data = {koutei_name: koutei_name}
       respond_to do |format|
         format.json { render json: data}
       end
   end
  end
  
private
# Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
    basho = Bashomaster.find_by 場所コード: @event.場所コード
    koutei = Kouteimaster.find_by 工程コード: @event.工程コード, 所属コード: @event.所属コード
    joutai = Joutaimaster.find_by 状態コード: @event.状態コード
    
    basho_name = basho.try(:場所名)
    koutei_name = koutei.try(:工程名)
    joutai_name = joutai.try(:状態名)
    
    @hash_param = { basho_name: basho_name, koutei_name: koutei_name, joutai_name: joutai_name }

  end
  
  def set_param
    @bashos = Bashomaster.all
    @joutais = Joutaimaster.all
    shain = Shainmaster.find_by 連携用社員番号: session['user_id']
    shozoku = shain.try(:所属コード)
    
    @kouteis = Kouteimaster.binding_shozoku(shozoku)
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:社員番号, :開始, :終了, :状態コード, :場所コード, :JOB, :所属コード, :工程コード, :工数, :計上)
  end
end