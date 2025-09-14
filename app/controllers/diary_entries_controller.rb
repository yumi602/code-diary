class DiaryEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: [ :show, :edit, :update, :destroy ]

  def index
  @entries = current_user.diary_entries
              .includes(photo_attachment: :blob) # 画像のN+1クエリ回避
              .order(walked_on: :desc, created_at: :desc)
  end


  def new
    @entry = current_user.diary_entries.new
  end

  def create
    @entry = current_user.diary_entries.new(entry_params)
    if @entry.save
      redirect_to diary_entries_path(@entry), notice: "日記を投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: "日記を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy
    redirect_to diary_entries_path, notice: "日記を削除しました"
  end

  private

  def set_entry
    @entry = current_user.diary_entries.find(params[:id])
  end

  def entry_params
    params.require(:diary_entry).permit(:body, :mood, :walked_on, :photo)
  end
end
