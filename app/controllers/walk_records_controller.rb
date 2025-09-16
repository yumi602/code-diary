class WalkRecordsController < ApplicationController
  before_action :set_walk_record, only: %i[show edit update destroy]

  def index
    @walk_records = WalkRecord.all
  end

  def new
    @walk_record = WalkRecord.new
  end

  def create
    @walk_record = WalkRecord.new(walk_record_params)
    @walk_record.user = current_user # ログインユーザーと紐付け

    if @walk_record.save
      redirect_to walk_records_path, notice: "散歩記録を登録しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @walk_record = WalkRecord.find(params[:id])
  end

  def update
    if @walk_record.update(walk_record_params)
      redirect_to @walk_record, notice: "散歩記録を更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @walk_record = WalkRecord.find(params[:id])
    @walk_record.destroy
    redirect_to walk_records_path, notice: "散歩記録を削除しました。"
  end

  private

  def set_walk_record
    @walk_record = WalkRecord.find(params[:id])
  end

  def walk_record_params
    params.require(:walk_record).permit(:date, :note)
  end
end
