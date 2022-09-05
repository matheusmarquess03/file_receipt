# frozen_string_literal: true
include ActionView::Helpers::NumberHelper

class SalesController < ApplicationController
  def index
    @total = ::Sales::CalculateTotalService.call
    @sales = Sale.all
    @sales = @sales.paginate(page: params[:page], per_page: 10)
  end

  def import
    @import = Sales::ImportService.call(params[:file])
    @total_gross_income = ::Sales::ImportService.call(params[:file])

    if @import[:success]
      redirect_to sales_path,
                  notice: "Sales was successfully imported. Total gross income: #{number_to_currency(@import[:value])}"
    else
      redirect_to sales_path, flash: { error: @import[:value] }
    end
  end
end
