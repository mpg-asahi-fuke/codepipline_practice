class Admin::SummariesController < Admin::ApplicationController
  def index
    @ir_report           = IrReport.find_by(id: params[:ir_report_id], company_id: params[:company_id])
    @ir_report_summaries = @ir_report.ir_report_summaries
    @ir_report_summary   = @ir_report.ir_report_summaries.new
  end

  def create
    @ir_report         = IrReport.find_by(id: params[:ir_report_id], company_id: params[:company_id])
    @ir_report_summary = @ir_report.ir_report_summaries.new(ir_report_summary_params)

    if @ir_report_summary.save
      redirect_to admin_company_ir_report_summaries_path(@ir_report.company, @ir_report)
    else
      @ir_report_summaries = @ir_report.ir_report_summaries
      render :index
    end
  end

  def ir_report_summary_params
    params.require(:ir_report_summary).permit(:content, :content_type)
  end
end
