class EventsController < ApplicationController
  def index #一覧表示画面
    @events = Event.all
  end
  
  def new #新規登録画面
    @event = Event.new
  end
  
  def show #詳細表示画面
    @event = Event.find(params[:id])
  end
  
  def edit #編集画面
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      
      flash[:notice] = 'イベントが作成されました'
      redirect_to events_path
    else
      render :new, alert: '保存に失敗しました'
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      #更新に成功した時の処理

      flash[:notice] = 'イベントが更新されました'
      redirect_to events_path, notice: 'イベントが更新されました'

    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    flash[:notice_destroy] = "スケジュールを削除しました"
    redirect_to events_path
  end


  def index # コントローラーで現在の日付を取得する
    @events = Event.all
    @today = Date.today
  end


  private

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date, :is_all_day, :memo)
  end
end
