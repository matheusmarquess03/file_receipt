class SalesController < ApplicationController
  def index
    def index
      @sales = Sale.all
      @sales = @sales.paginate(:page => params[:page], :per_page => 10)
    end

    def import
      raise 'File not found!' if params[:file].blank?
    end
  end
end
