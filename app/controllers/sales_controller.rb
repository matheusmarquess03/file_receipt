class SalesController < ApplicationController
  def index
    def index
      @sales = Sale.all
      @sales = @sales.paginate(:page => params[:page], :per_page => 10)
    end

    def import
      raise 'File not found!' if params[:file].blank?

      @total_gross_income = ::Sales::ImportService.call(params[:file])

      if @total_gross_income
        redirect_to sales_path, notice: "Sales was successfully imported. Total gross income: #{@total_gross_income}"
      end
    end
  end
end
