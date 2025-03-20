class Admin::IrReportsController < ApplicationController
  layout "admin"

  def index
    @company    = Company.find(params[:company_id])
    @ir_reports = @company.ir_reports
    @ir_report  = @company.ir_reports.new
  end

  def create
    @company   = Company.find(params[:company_id])
    @ir_report = @company.ir_reports.new(ir_report_params)
    if @ir_report.save!
      redirect_to admin_company_ir_reports_path(@company)
    else
      @ir_reports = @company.ir_reports
      render :index
    end
  end

  def ir_report_params
    params.require(:ir_report).permit(:title, :content, :published_at, :url)
  end
end
