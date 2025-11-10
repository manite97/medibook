class DailyCollectReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dcr, only: [:show, :edit, :update, :destroy]

  def index
    @dcrs = current_user.daily_collect_reports.order(created_at: :desc)
  end

  def show; end

  def new
    @dcr = current_user.daily_collect_reports.new
  end

  def create
    @dcr = current_user.daily_collect_reports.new(dcr_params)
    if @dcr.save
      redirect_to daily_collect_reports_path, notice: "DCR created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @dcr.update(dcr_params)
      redirect_to @dcr, notice: "DCR updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dcr.destroy
    redirect_to daily_collect_reports_path, notice: "DCR deleted successfully."
  end

  private

  def set_dcr
    @dcr = current_user.daily_collect_reports.find_by(id: params[:id])
    redirect_to daily_collect_reports_path, alert: "Not authorized" unless @dcr
  end

  def dcr_params
    params.require(:daily_collect_report).permit(:hospital_name, :doctor_name, :sample_product_name, :quantity_distributed, :report_date)
  end
end
