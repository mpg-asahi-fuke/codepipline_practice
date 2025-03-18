class Admin::CompaniesController < ApplicationController
  layout "admin"

  def index
    @companies = Company.all
    @company   = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to admin_companies_path
    else
      @companies = Company.all
      render :index
    end
  end

  def company_params
    params.require(:company).permit(:name, :number)
  end
end
