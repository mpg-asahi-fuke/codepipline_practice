class EndUser::IrReportsController < ApplicationController
  def index
    @ir_reports = IrReport.all
  end
end
