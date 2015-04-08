class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    # @events = Event.all
    @events = Event.binding_event
    @user = User.all
  end
  
  def edit
    
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        Rails.logger.info 'Event created'
        format.html { redirect_to events_url, notice: '新規成功出来ました。' }
      else
        Rails.logger.info 'Event uncreated'
        format.html { render 'new' }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
        # format.js { render json: @user.errors, status: :unprocessable_entity }
        # format.js { render 'show' }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_url, notice: '更新成功できました。' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @kouteimaster.errors, status: :unprocessable_entity }
      end
    end

  end

private
# Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:社員番号, :開始, :終了, :状態コード, :場所コード, :JOB, :所属コード, :工程コード, :工数, :計上)
  end
end