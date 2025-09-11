class DiaryEntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entries = current_user.diary_entries.order(walked_on: :desc)
  end

  def show
    @entry = current_user.diary_entries.find(params[:id])
  end
end
