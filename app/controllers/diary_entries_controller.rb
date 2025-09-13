class DiaryEntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entries = current_user.diary_entries.order(walked_on: :desc)
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
    @entry = current_user.diary_entries.find(params[:id])
  end
end

private

def entry_params
  params.require(:diary_entry).permit(:body, :mood, :walked_on, :photo)
end
