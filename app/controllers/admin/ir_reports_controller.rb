class Admin::IrReportsController < ApplicationController
  layout "admin"

  def index
    @ir_reports = IrReport.all
    @ir_report  = IrReport.new
  end

  def create
    @report = IrReport.new(ir_report_params)
    if @report.save
      redirect_to admin_ir_reports_path
    else
      @ir_reports = IrReport.all
      render :index
    end
  end

  def ir_report_params
    params.require(:ir_report).permit(:title, :description)
  end
end
